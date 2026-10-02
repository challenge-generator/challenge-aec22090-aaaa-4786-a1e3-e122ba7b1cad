Feature: Shopping Cart Management
  As a customer
  I want to manage my shopping cart
  So that I can purchase items I selected

  Background:
    Given the application is running
    And the user has added items to the cart

  Scenario: Add item to cart
    Given the user is viewing a product
    When the user taps the add to cart button
    Then the item should be added to the cart
    And the cart count should increase
    And the user should see a success notification

  Scenario: Remove item from cart
    Given the user has items in the cart
    When the user removes an item
    Then the item should be removed from the cart
    And the cart total should update
    And the cart count should decrease

  Scenario: Update item quantity
    Given the user has items in the cart
    When the user changes the quantity of an item
    Then the cart should update the item quantity
    And recalculate the total price

  Scenario: Cart maximum items limit
    Given the cart has reached the maximum item limit
    When the user tries to add another item
    Then the system should display an error message
    And prevent adding the item

  Scenario: View cart total
    Given the user has items in the cart
    When the user views the cart
    Then the system should display the subtotal for each item
    And display the total amount

  Scenario: Clear cart
    Given the user has items in the cart
    When the user clears the entire cart
    Then all items should be removed
    And the cart should be empty

  Scenario: Proceed to checkout
    Given the user has items in the cart
    When the user taps the checkout button
    Then the system should navigate to checkout screen
    And display order summary