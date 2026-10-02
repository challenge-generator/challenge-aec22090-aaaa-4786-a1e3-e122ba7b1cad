Feature: Transaction Processing
  As a customer
  I want to complete purchase transactions
  So that I can buy products from the application

  Background:
    Given the application is running
    And the user has items in the cart
    And the user is on the checkout screen

  Scenario: Process successful transaction
    Given the user has valid payment information
    And the cart total meets the minimum requirement
    When the user submits the transaction
    Then the system should process the payment
    And display a success confirmation
    And create a transaction record
    And clear the cart

  Scenario: Transaction below minimum amount
    Given the cart total is below the minimum transaction amount
    When the user tries to submit the transaction
    Then the system should display an error message
    And prevent the transaction from processing

  Scenario: Payment method validation
    Given the user has entered invalid payment information
    When the user submits the transaction
    Then the system should validate the payment details
    And display validation errors

  Scenario: Network failure during transaction
    Given the user submits a transaction
    When a network error occurs during processing
    Then the system should display a network error message
    And allow the user to retry the transaction

  Scenario: Transaction timeout
    Given the user submits a transaction
    When the transaction takes longer than expected
    Then the system should display a timeout message
    And allow the user to retry

  Scenario: View transaction history
    Given the user has completed previous transactions
    When the user navigates to transaction history
    Then the system should display all past transactions
    And include transaction date, amount, and status

  Scenario: Transaction with invalid data
    Given the user submits a transaction with missing data
    When the system validates the transaction
    Then the system should reject the transaction
    And display specific validation errors