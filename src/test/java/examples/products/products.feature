Feature: Casos de prueba de el modulo Productos
  Scenario: CP-01 creación de producto
    Given  url "https://fakestoreapi.com"
    And path "products"
  ##  And header Accept = "application/json"
    And request
    """
    {
    "id": 1,
    "title": "TV",
    "price": 5,
    "description": "prueba",
    "category": "Artefacto",
    "image": "prueba"
    }
    """
    When method post
    Then status 201

  Scenario: CP-02 eliminar producto
    * def id = 1
    Given  url "https://fakestoreapi.com"
    And path "products/" + id
    When method delete
    Then status 200

Scenario: CP-03 actualizar producto
  * def id = 0
  Given  url "https://fakestoreapi.com"
  And path "products/" + id
  And request
    """
    {
    "id": 0,
    "title": "TV",
    "price": 5,
    "description": "prueba",
    "category": "Artefacto",
    "image": "prueba"
    }
    """
  When method put
  Then status 200