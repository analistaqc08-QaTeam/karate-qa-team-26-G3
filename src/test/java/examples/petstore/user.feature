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
    * print response
    And match response.type == '#string'
    And match response.code == 200
    And  match response.message =='#string'

    Scenario: CP-02 creación de usuario con variables
      * def body =
      """
       {
      "id": 0,
      "username": "Demo4",
      "firstName": "abc",
      "lastName": "perez",
      "email": "abc",
      "password": "11111",
      "phone": "21233333",
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
      * print response
      And match response.type == '#string'
      And match response.code == 200
      And  match response.message =='#string'

  Scenario: CP-04 eliminar usuario exitoso
    * def username = "Demo2"
    Given url "https://petstore.swagger.io/v2"
    And  path "user/"  + username
    When method delete
    Then status 200
    * print response
    And match response.code == 200


  Scenario: CP-05  login exitoso
    Given  url "https://petstore.swagger.io/v2"
    And path "user/login"
    And  param username = "Demo"
    And  param password = "Demo"
    When method get
    Then status 200
    ##Math es para comparar
    ##para comparar se coloca dos veces el igual
    ##And  match response == { "code": 200, "type": "unknown","message": "logged in user session:1783730939481"}
    And match response.code == 200
    And match response.type == "unknown"

  Scenario: CP-06 create booking
    Given  url "https://restful-booker.herokuapp.com"
    And path "/booking"
    And header Accept = "application/json"
    And  form field  firstname = "Pepito2"
    And form field lastname = "Fin"
    And form field totalprice = 111
    And form field depositpaid = true
    And form field bookingdates[checkin] = "2018-01-01"
    And form field bookingdates[checkout] = "2019-01-01"
    When method post
    Then status 200
    * print response



    ## request de forma de linea
   Scenario: CP-07 create token
     Given  url "https://restful-booker.herokuapp.com"
     And path "auth"
     And request { "username" : "admin", "password" : "password123" }
     When  method post
     Then status 200

   Scenario: CP-08  actualizar usuario con archivo externo
     * def username = "Demo"
    Given url "https://petstore.swagger.io/v2"
    # And path "user/"  + username
     And  path "user" , username
    # coloca el nombre del archivo
     And request read('bodyActualizar.json')
    When  method put
    Then status 200
     And match responseType == "json"
   