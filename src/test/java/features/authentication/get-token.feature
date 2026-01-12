Feature: Get token

  Background:
    Given url baseUrl

  @token
  Scenario Outline: <paths-scenarios>
    * def requestBody = read('classpath:features/account/userdata/<body>')
    * def schema = read('classpath:features/schemas/<expected-schema-path>')

    Given path '/Account/v1/GenerateToken'
    And request requestBody
    When method post
    Then match response.result == <result>
    And match response == schema

    Examples:
      | paths-scenarios                              | body                             | result                          | expected-schema-path                  |
      | Happy Ending - Token with valid credentials! | fixed-user-credentials.json      | "User authorized successfully." | authentication/get-token-success.json |
      | Bad Ending - Token with invalid credentials! | invalid-user-credentials.json    | "User authorization failed."    | authentication/get-token-fail.json    |