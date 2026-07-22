Feature: Prueba de deposito

  @deposit
  Scenario: CP01-Agregar saldo a cuenta
    Given url "https://bankapi-n1t8.onrender.com"
    Given path "/api/deposits"
    And header Authorization = tokenUser
    And request
    """
    {
      "accountId": "#(fromAccount)",
      "amount": 100,
      "depositType": "bank_transfer",
      "reference": "Salary deposit"
    }
    """
    When method post
    Then status 201

  Scenario: CP02-Agregar saldo a cuenta
    Given  url "/api/deposits"
    And headers  Authorization = "Bearer " + token
    And  request
      """
  {
  "accountId": "c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11",
  "amount": 500,
  "depositType": "bank_transfer",
  "reference": "Salary deposit"
}
    """
    When  method post
    Then status 201