Feature: Create User

  Background:
    Given url baseUrl

    @user
  Scenario Outline: <paths-scenarios>
    * def userName = Java.type('features.support.utils.Utils').generateRandomUsername()
    * def requestBody = read('classpath:features/account/userdata/<body>')
    * def schema = read('classpath:features/schemas/<expected-schema>')

    Given path "/Account/v1/User"
    And request requestBody
    When method post
    Then status <expected-status>
      And match response == schema
    Examples:
      | paths-scenarios                                    | body                             | expected-status | expected-schema                  |
      | Happy Ending - Creating with valid credentials!    | user-credentials.json            | 201             | account/create-user-success.json |
      | Bad Ending - Creating with duplicated credentials! | fixed-user-credentials.json      | 406             | common/error-schema.json         |