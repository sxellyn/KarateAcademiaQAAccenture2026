Feature: Add Book

  Background:
    * def auth = call read('classpath:features/authentication/auth.feature')
    * def token = auth.token
    * def validUserID = auth.userID
    * def requestBody = read('classpath:features/bookstore/bookdata/book-data.json')
    * def allBooksCatalog = call read('classpath:features/bookstore/list-all-books.feature')
    Given url baseUrl

  @books
  Scenario Outline: <paths-scenarios>
    * requestBody.userId = <userID>
    * def schema = read('classpath:features/schemas/<expected-schema-path>')
    * def firstBookISBN = allBooksCatalog.response.books[0].isbn
    * requestBody.collectionOfIsbns[0].isbn = firstBookISBN

    Given path "/BookStore/v1/Books"
    And header Authorization = 'Bearer ' + token
    And request requestBody
    When method post
    Then status <status>
    And match response == schema

    Examples:
      | paths-scenarios                                     | userID           | status | expected-schema-path     |
      | Happy Ending - Creating new book with valid userId! | validUserID      | 201    | books/sucess-schema.json |
      | Bad Ending - Creating new book with invalid userId! | cachorroquente   | 401    | common/error-schema.json |