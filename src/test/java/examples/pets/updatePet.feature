Feature: Update pets

  Background:
    * url baseUrl
    * path 'pets'

  Scenario: update a pet
    Given request {"name": "Bingo", "type": "Perro","age": 1}
    And method post
    And status 201
    And def petId = $.data.id
    When url "http://localhost:3000/pets/" + petId
    And request {"name": "Naruto", "type": "gato","age": 1}
    And method put
    Then status 200
    And match $.data.name == "Naruto"
    And match $.data.type == "gato"

  Scenario: update partially a pet
    Given request {"name": "BingoPUT", "type": "Perro","age": 1}
    And method post
    And status 201
    And def petId = $.data.id
    When url "http://localhost:3000/pets/" + petId
    And request {"name": "Bluey"}
    And method patch
    Then status 200
    And match $.data.name == "Bluey"
