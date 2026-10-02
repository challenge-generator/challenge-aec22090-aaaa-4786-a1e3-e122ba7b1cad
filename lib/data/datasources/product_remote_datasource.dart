part of flutter_ecommerce_app;

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts({int page = 1, int limit = 20});
  Future<ProductModel> getProductById(String id);
  Future<List<ProductModel>> searchProducts(String query, {int page = 1, int limit = 20});
  Future<List<ProductModel>> getProductsByCategory(String category, {int page = 1, int limit = 20});
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;
  final String baseUrl;

  ProductRemoteDataSourceImpl({
    required this.client,
    required this.baseUrl,
  });

  @override
  Future<List<ProductModel>> getProducts({int page = 1, int limit = 20}) async {
    try {
      final uri = Uri.parse('$baseUrl${AppConstants.productsEndpoint}').replace(
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
      throw const TimeoutException('Product fetch timeout');
    } on http.ClientException catch (e) {
      throw NetworkException('Network error: ${e.message}');
    } catch (e) {
      if (e is AppException) rethrow;
      throw ServerException('Failed to fetch products: $e');
    }
  }

  @override
  Future<ProductModel> getProductById(String id) async {
    try {
      final uri = Uri.parse('$baseUrl${AppConstants.productsEndpoint}/$id');

      final response = await client.get(
        uri,
        headers: _buildHeaders(),
      ).timeout(const Duration(milliseconds: 200));

      return _handleSingleResponse(response);
    } on TimeoutException {
      throw const TimeoutException('Product fetch timeout');
    } on http.ClientException catch (e) {
      throw NetworkException('Network error: ${e.message}');
    } catch (e) {
      if (e is AppException) rethrow;
      throw ServerException('Failed to fetch product: $e');
    }
  }

  @override
  Future<List<ProductModel>> searchProducts(String query, {int page = 1, int limit = 20}) async {
    try {
      final uri = Uri.parse('$baseUrl${AppConstants.productsEndpoint}/search').replace(
        queryParameters: {
          'q': query,
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
      throw const TimeoutException('Search timeout');
    } on http.ClientException catch (e) {
      throw NetworkException('Network error: ${e.message}');
    } catch (e) {
      if (e is AppException) rethrow;
      throw ServerException('Failed to search products: $e');
    }
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(String category, {int page = 1, int limit = 20}) async {
    try {
      final uri = Uri.parse('$baseUrl${AppConstants.productsEndpoint}/category/$category').replace(
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
      throw const TimeoutException('Category fetch timeout');
    } on http.ClientException catch (e) {
      throw NetworkException('Network error: ${e.message}');
    } catch (e) {
      if (e is AppException) rethrow;
      throw ServerException('Failed to fetch category products: $e');
    }
  }

  Map<String, String> _buildHeaders() {
    return {
      'Content-Type': AppConstants.contentTypeJson,
      'Accept': AppConstants.contentTypeJson,
    };
  }

  List<ProductModel> _handleListResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final data = json.decode(response.body);
        if (data is List) {
          return data.map((item) => ProductModel.fromJson(item as Map<String, dynamic>)).toList();
        } else if (data is Map<String, dynamic> && data['data'] is List) {
          return (data['data'] as List)
              .map((item) => ProductModel.fromJson(item as Map<String, dynamic>))
              .toList();
        }
        throw const InvalidDataException('Invalid products response format');
      case 401:
        throw const AuthenticationException('Unauthorized access');
      case 403:
        throw const PermissionException('Access forbidden');
      case 404:
        throw const ServerException('Products not found', statusCode: 404);
      case 500:
      default:
        throw ServerException(
          'Server error: ${response.statusCode}',
          statusCode: response.statusCode,
        );
    }
  }

  ProductModel _handleSingleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final data = json.decode(response.body);
        if (data is Map<String, dynamic>) {
          return ProductModel.fromJson(data);
        }
        throw const InvalidDataException('Invalid product response format');
      case 401:
        throw const AuthenticationException('Unauthorized access');
      case 403:
        throw const PermissionException('Access forbidden');
      case 404:
        throw const ServerException('Product not found', statusCode: 404);
      case 500:
      default:
        throw ServerException(
          'Server error: ${response.statusCode}',
          statusCode: response.statusCode,
        );
    }
  }
}