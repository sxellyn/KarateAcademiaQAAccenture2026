Feature: Add Book Reusable

  @setup
  Scenario:
    * def body = read('classpath:features/bookstore/bookdata/book-data.json')

    Given url baseUrl
    And path '/BookStore/v1/Books'
    And header Authorization = 'Bearer ' + token
    And request body
    When method post
    Then status 201
