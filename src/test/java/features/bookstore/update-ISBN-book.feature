Feature: Update Book by ISBN

  Background:
    * def auth = call read('classpath:features/authentication/auth.feature')
    * def token = auth.token
    * def validUserID = auth.userID
    Given url baseUrl

  @books
  Scenario Outline: <paths-scenarios>
    * call read('classpath:features/bookstore/add-book-reusable.feature') { token: '#(token)', userID: '#(validUserID)' }

    * def requestBody = read('classpath:features/bookstore/bookdata/update-book.json')
    * requestBody.userId = <userID>
    * requestBody.isbn = <newISBN>

    * def schema = read('classpath:features/schemas/<expected-schema-path>')

    Given path '/BookStore/v1/Books', <oldISBN>
    And header Authorization = 'Bearer ' + token
    And request requestBody
    When method put
    Then status <status>
    And match response == schema

    Examples:
      | paths-scenarios                              | userID      | oldISBN         | newISBN         | status | expected-schema-path          |
      | Happy Ending - Update book successfully      | validUserID | '9781449325862' | '9781593275846' | 200    | books/update-book-schema.json |
      | Bad Ending - Update book with invalid ISBN   | validUserID | '0000000000000' | '9781593275846' | 400    | common/error-schema.json      |
