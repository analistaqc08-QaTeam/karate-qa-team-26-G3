Feature: Casos de prueba de inicio de session


  @login
  Scenario: CP01-Inicio de session exitoso
    Given url "https://bankapi-n1t8.onrender.com"
    And path "/api/auth/login"
    And request { "email": "testQA@bankapi.com", "password": "password123" }
    When method post
    Then  status 200
    * def token = response.data.accessToken

@logininvalido
  Scenario: CP02- Credenciales invalidas
    Given url "https://bankapi-n1t8.onrender.com"
    And path "/api/auth/login"
    And request { "email": "testQA12@bankapi.com", "password": "password123" }
    When method post
    Then  status 401
    And match response.error contain  <param><any> "code":"INVALID_CREDENTIALS"