Feature: Pruebas del modulo de transferencia
  Background:
    * def apiLogin = call read('loginUser.feature@login')
    * def token = apiLogin.token
    Given url "https://bankapi-n1t8.onrender.com"

  Scenario Outline: CP01-Transferencia exitos
    And  path "/api/transfers"
    And headers Authorization = "Bearer " + token
    And request
     """
    {
      "fromAccountId": "<fromAccount>",
      "toAccountId": "<toAccount>",
      "amount": <amount>,
      "description": "Test transfer",
      "transferType": "internal"
    }
    """
    When method post
    Then status 201

    Examples:
      |fromAccount| toAccount| amount|
      |fb0abf0a-f3a9-45b3-8740-792de5cc6b06 | 3c30cea3-be79-4b28-812e-90a12055026b |  50  |