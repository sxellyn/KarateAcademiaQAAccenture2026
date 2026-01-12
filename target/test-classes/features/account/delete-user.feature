Feature: Delete User

  Background:
    * def errorSchema = read('classpath:features/schemas/common/error-schema.json')
    * def auth = call read('classpath:features/authentication/auth.feature')
    * def validToken = auth.token
    * def userID = auth.userID
    Given url baseUrl

  @user
  Scenario Outline: <paths-scenarios>
    * def deleteSuccessResponse = ''

    Given path "/Account/v1/User", userID
    And header Authorization = 'Bearer ' + <token>
    When method delete
    Then status <expected-status>
    And match response == <expected-schema>

    Examples:
      | paths-scenarios                           | token           | expected-status | expected-schema       |
      | Happy Ending - Deleting with valid token! | validToken      | 204             | deleteSuccessResponse |
      | Bad Ending - Deleting with Invalid token! | "invalid token" | 401             | errorSchema           |