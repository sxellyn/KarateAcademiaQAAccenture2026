Feature: Get Book by ISBN

  Background:
    * def auth = call read('classpath:features/authentication/auth.feature')
    * def token = auth.token
    Given url baseUrl

  @books
  Scenario Outline: <paths-scenarios>
    * def schema = read('classpath:features/schemas/<expected-schema-path>')

    Given path '/BookStore/v1/Book'
    And param ISBN = <isbn>
    And header Authorization = 'Bearer ' + token
    When method get
    Then status <status>
    And match response == schema

    Examples:
      | paths-scenarios                                   | isbn               | status | expected-schema-path             |
      | Happy Ending - Get book by valid ISBN!            | '9781449325862'    | 200    | books/book-by-isbn-schema.json   |
      | Bad Ending - Get book with invalid ISBN!          | '0000000000000'    | 400    | common/error-schema.json         |
