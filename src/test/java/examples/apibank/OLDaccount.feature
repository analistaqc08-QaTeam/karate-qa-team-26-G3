Feature: Modulo de cuentas
  Background:
    * def apilogin = call read('loginuser.feature@login')
    * print apilogin.token
    * def token = apilogin.token

  Scenario: CP01-Listar cuentas OK con call
    Given url "https://bankapi-n1t8.onrender.com"
    And headers Authorization = 'Bearer '+token
    And path "/api/accounts"
    When  method get
    Then  status 200

  Scenario: CP01-Listar cuentas
    * def token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIxOTAyYzEwZS1lNWU0LTRhOWUtYjEyNy03MmMzYzhlZTdmNTYiLCJlbWFpbCI6InRlc3RRQTFAYmFua2FwaS5jb20iLCJpYXQiOjE3ODQwODIyNTksImV4cCI6MTc4NDE2ODY1OX0.6EO7isr2EjvpBjXbl1IzY_QFFf-rPCMafu88xqg1jdU'
    Given url "https://bankapi-n1t8.onrender.com"
    And headers Authorization = 'Bearer '+token
    And path "/api/accounts"
    When  method get
    Then  status 200


  Scenario: CP02-Listar cuentas OK
    Given url "https://bankapi-n1t8.onrender.com"
    And path  "/api/auth/login"
    And  request
    """
     {
  "email": "testQA1@bankapi.com",
  "password": "password123",
      }
      """
    When method post
    Then  status 200
    * print response
    * def token = response.data.accessToken
    Given url "https://bankapi-n1t8.onrender.com"
    And headers Authorization = 'Bearer '+token
    And path "/api/accounts"
    When  method get
    Then  status 200

