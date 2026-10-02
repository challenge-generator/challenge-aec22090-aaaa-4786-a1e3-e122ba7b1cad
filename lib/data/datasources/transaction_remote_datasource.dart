part of flutter_ecommerce_app;

abstract class TransactionRemoteDataSource {
  Future<TransactionModel> createTransaction(TransactionModel transaction);
  Future<TransactionModel> getTransactionById(String id);
  Future<List<TransactionModel>> getTransactionsByUserId(String userId, {int page = 1, int limit = 20});
  Future<TransactionModel> updateTransactionStatus(String id, TransactionStatusModel status);
  Future<TransactionModel> cancelTransaction(String id);
  Future<TransactionModel> retryTransaction(String id);
}

class TransactionRemoteDataSourceImpl implements TransactionRemoteDataSource {
  final http.Client client;
  final String baseUrl;

  TransactionRemoteDataSourceImpl({
    required this.client,
    required this.baseUrl,
  });

  @override
  Future<TransactionModel> createTransaction(TransactionModel transaction) async {
    try {
      final uri = Uri.parse('$baseUrl${AppConstants.transactionsEndpoint}');

      final response = await client.post(
        uri,
        headers: _buildHeaders(),
        body: json.encode(transaction.toJson()),
      ).timeout(const Duration(milliseconds: 200));

      return _handleSingleResponse(response);
    } on TimeoutException {
      throw const TimeoutException('Transaction creation timeout');
    } on http.ClientException catch (e) {
      throw NetworkException('Network error: ${e.message}');
    } catch (e) {
      if (e is AppException) rethrow;
      throw TransactionException('Failed to create transaction: $e');
    }
  }

  @override
  Future<TransactionModel> getTransactionById(String id) async {
    try {
      final uri = Uri.parse('$baseUrl${AppConstants.transactionsEndpoint}/$id');

      final response = await client.get(
        uri,
        headers: _buildHeaders(),
      ).timeout(const Duration(milliseconds: 200));

      return _handleSingleResponse(response);
    } on TimeoutException {
      throw const TimeoutException('Transaction fetch timeout');
    } on http.ClientException catch (e) {
      throw NetworkException('Network error: ${e.message}');
    } catch (e) {
      if (e is AppException) rethrow;
      throw ServerException('Failed to fetch transaction: $e');
    }
  }

  @override
  Future<List<TransactionModel>> getTransactionsByUserId(String userId, {int page = 1, int limit = 20}) async {
    try {
      final uri = Uri.parse('$baseUrl${AppConstants.transactionsEndpoint}/user/$userId').replace(
        queryParameters: {
          'page': page.toString(),
          'limit': limit.toString(),
        },
      );

      final response = await client.get(
        uri,
        headers: _buildHeaders(),
      ).timeout(const Duration(milliseconds: 200));

      return _handleListResponse(response);
    } on TimeoutException {
      throw const TimeoutException('Transactions fetch timeout');
    } on http.ClientException catch (e) {
      throw NetworkException('Network error: ${e.message}');
    } catch (e) {
      if (e is AppException) rethrow;
      throw ServerException('Failed to fetch transactions: $e');
    }
  }

  @override
  Future<TransactionModel> updateTransactionStatus(String id, TransactionStatusModel status) async {
    try {
      final uri = Uri.parse('$baseUrl${AppConstants.transactionsEndpoint}/$id/status');

      final response = await client.patch(
        uri,
        headers: _buildHeaders(),
        body: json.encode({'status': status.value}),
      ).timeout(const Duration(milliseconds: 200));

      return _handleSingleResponse(response);
    } on TimeoutException {
      throw const TimeoutException('Transaction status update timeout');
    } on http.ClientException catch (e) {
      throw NetworkException('Network error: ${e.message}');
    } catch (e) {
      if (e is AppException) rethrow;
      throw ServerException('Failed to update transaction status: $e');
    }
  }

  @override
  Future<TransactionModel> cancelTransaction(String id) async {
    try {
      final uri = Uri.parse('$baseUrl${AppConstants.transactionsEndpoint}/$id/cancel');

      final response = await client.post(
        uri,
        headers: _buildHeaders(),
      ).timeout(const Duration(milliseconds: 200));

      return _handleSingleResponse(response);
    } on TimeoutException {
      throw const TimeoutException('Transaction cancellation timeout');
    } on http.ClientException catch (e) {
      throw NetworkException('Network error: ${e.message}');
    } catch (e) {
      if (e is AppException) rethrow;
      throw TransactionException('Failed to cancel transaction: $e');
    }
  }

  @override
  Future<TransactionModel> retryTransaction(String id) async {
    try {
      final uri = Uri.parse('$baseUrl${AppConstants.transactionsEndpoint}/$id/retry');

      final response = await client.post(
        uri,
        headers: _buildHeaders(),
      ).timeout(const Duration(milliseconds: 200));

      return _handleSingleResponse(response);
    } on TimeoutException {
      throw const TimeoutException('Transaction retry timeout');
    } on http.ClientException catch (e) {
      throw NetworkException('Network error: ${e.message}');
    } catch (e) {
      if (e is AppException) rethrow;
      throw TransactionException('Failed to retry transaction: $e');
    }
  }

  Map<String, String> _buildHeaders() {
    return {
      'Content-Type': AppConstants.contentTypeJson,
      'Accept': AppConstants.contentTypeJson,
    };
  }

  List<TransactionModel> _handleListResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final data = json.decode(response.body);
        if (data is List) {
          return data.map((item) => TransactionModel.fromJson(item as Map<String, dynamic>)).toList();
        } else if (data is Map<String, dynamic> && data['data'] is List) {
          return (data['data'] as List)
              .map((item) => TransactionModel.fromJson(item as Map<String, dynamic>))
              .toList();
        }
        throw const InvalidDataException('Invalid transactions response format');
      case 401:
        throw const AuthenticationException('Unauthorized access');
      case 403:
        throw const PermissionException('Access forbidden');
      case 404:
        throw const ServerException('Transactions not found', statusCode: 404);
      case 500:
      default:
        throw ServerException(
          'Server error: ${response.statusCode}',
          statusCode: response.statusCode,
        );
    }
  }

  TransactionModel _handleSingleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        final data = json.decode(response.body);
        if (data is Map<String, dynamic>) {
          return TransactionModel.fromJson(data);
        }
        throw const InvalidDataException('Invalid transaction response format');
      case 401:
        throw const AuthenticationException('Unauthorized access');
      case 403:
        throw const PermissionException('Access forbidden');
      case 404:
        throw const ServerException('Transaction not found', statusCode: 404);
      case 409:
        final data = json.decode(response.body);
        throw TransactionException(data['message'] as String? ?? 'Transaction conflict');
      case 422:
        final data = json.decode(response.body);
        throw ValidationException(
          data['message'] as String? ?? 'Validation failed',
          errors: (data['errors'] as List<dynamic>?)?.cast<String>() ?? [],
        );
      case 500:
      default:
        throw ServerException(
          'Server error: ${response.statusCode}',
          statusCode: response.statusCode,
        );
    }
  }
}