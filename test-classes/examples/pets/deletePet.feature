Feature: Delete pets

  Background:
    * url baseUrl
    * path 'pets'

  Scenario: Delete a pet
    Given request {"name": "BingoPUT", "type": "Perro","age": 1}
    And method post
    And status 201
    And def petId = $.data.id
    And url "http://localhost:3000/pets/" + petId
    When method delete
    Then status 204