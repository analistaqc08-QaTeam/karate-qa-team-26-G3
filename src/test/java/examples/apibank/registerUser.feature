Feature: Casos de prueba de registro de usuario

  Background:

    Given url "https://bankapi-n1t8.onrender.com"

  Scenario: CP01-Registro de usuario Exitoso
    * def data =
    """
  {
  "email": "testQA10@bankapi.com",
  "password": "password123",
  "fullName": "TestUser"
}
    """
    And path "/api/auth/register"
    And request data
    When method post
    Then status 201
    And match response.data.user contains { "fullName": "TestUser"}


  Scenario: CP02-Registro usuario existente
    * def data =
    """
   {
  "email": "testQA1@bankapi.com",
  "password": "password123",
  "fullName": "TestUser"
}
    """
    And path "/api/auth/register"
    And request data
    When method post
    Then status 409
    * print response
    And match response.error == {"code": "USER_EXISTS","message": "User already exists"}
