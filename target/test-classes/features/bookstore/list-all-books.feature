Feature: List All Books (Catalog)

  Background:
    * def auth = call read('classpath:features/authentication/auth.feature')
    * def token = auth.token
    * def userID = auth.userID
    Given url baseUrl

  @books
  Scenario: List catalog successfully!
    * def schema = read('classpath:features/schemas/books/list-all-books-schema.json')

    Given path '/BookStore/v1/Books'
    When method get
    Then status 200
    And match response == schema
