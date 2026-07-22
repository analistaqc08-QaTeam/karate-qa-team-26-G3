Feature: Modulo de cuentas

  Background:
    * def apiLogin = call read('../loginUser.feature@login')
    #* print apiLogin
    * def token = apiLogin.token
    Given url "https://bankapi-n1t8.onrender.com"

  Scenario: CP02-Listar cuentas ok con call
    Given header Authorization = 'Bearer '+ token
    And path "/api/accounts"
    When method get
    Then status 200

  Scenario Outline: Crear cuenta masiva <id>
    Given path "/api/accounts"
    And header Authorization = 'Bearer '+ token
    And request { "accountType": "savings", "currency": "#(currency)", "initialBalance": #(balance) }
    When method post
    Then status 201

    Examples:
      | read('dataAccount.csv') |
