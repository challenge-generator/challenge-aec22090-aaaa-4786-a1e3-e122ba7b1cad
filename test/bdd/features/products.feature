Feature: Product Management
  As a user of the e-commerce application
  I want to browse and manage products
  So that I can find and purchase items I need

  Background:
    Given the application is running
    And the user is on the product list screen

  Scenario: View list of products
    Given the product catalog is loaded
    When the user navigates to the products section
    Then the system should display all available products
    And each product should show name, price, and image

  Scenario: Search for a product
    Given the product catalog contains multiple items
    When the user enters a search term in the search field
    Then the system should filter products matching the search term
    And display the filtered results

  Scenario: View product details
    Given the user is viewing the product list
    When the user taps on a specific product
    Then the system should navigate to the product detail screen
    And display full product information including description

  Scenario: Filter products by category
    Given the product catalog has items in multiple categories
    When the user selects a category filter
    Then the system should display only products in that category

  Scenario: Sort products by price
    Given the user is viewing the product list
    When the user selects price sorting option
    Then the system should reorder products by price
    And display them in ascending or descending order

  Scenario: Add product to wishlist
    Given the user is viewing a product
    When the user taps the wishlist button
    Then the product should be added to the wishlist
    And the user should see a confirmation

  Scenario: Product out of stock
    Given a product has zero stock
    When the user views that product
    Then the system should display an out of stock message
    And disable the add to cart button