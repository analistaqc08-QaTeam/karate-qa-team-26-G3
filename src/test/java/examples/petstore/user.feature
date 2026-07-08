Feature: Casos de prueba de el modulo User
  Scenario: CP-01 creación de usuario exitoso
    Given url "https://petstore.swagger.io/v2"
    And path "user"
    And request
    """
    {
  "id": 0,
  "username": "Demo",
  "firstName": "Demo1",
  "lastName": "Demo",
  "email": "abc",
  "password": "abc",
  "phone": "976521876",
  "userStatus": 0
    }
    """
    When method post
    Then status 200

    Scenario: CP-02 creación de usuario con variables
      * def body =
      """
      {
      "id": 0,
      "username": "Demo",
      "firstName": "Demo1",
      "lastName": "Demo",
      "email": "abc",
      "password": "abc",
      "phone": "976521876",
      "userStatus": 0
        }
      """

      Given url "https://petstore.swagger.io/v2"
      And path "user"
      And  request body
      When method post
      Then status 200
      * print "Hola"

    Scenario: CP-03 actualización usuario exitoso
      * def username = "Demo"
      Given url "https://petstore.swagger.io/v2"
      And path "user/"  + username
     # And  path "user" , username
      And request
      """
          {
      "id": 0,
      "username": "Demo2",
      "firstName": "Demo2",
      "lastName": "Demo",
      "email": "abc",
      "password": "abc",
      "phone": "s976521876tring",
      "userStatus": 0
         }
      """
      When  method put
      Then status 200

