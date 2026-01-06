Feature: Create new pets

  Background:
    * url baseUrl
    * path 'pets'

  Scenario: Create a new dog
    Given request {"name": "PruebaPost", "type": "Perro","age": 1}
    When method post
    Then status 201
    And match $.message contains "Pet created"

  Scenario: Search a new dog
    Given request {"name": "PruebaGET", "type": "Perro","age": 1}
    And method post
    And status 201
    And def petId = $.data.id
    When url "http://localhost:3000/pets/" + petId
    And method get
    Then status 200

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

  Scenario: Delete a pet
    Given request {"name": "BingoPUT", "type": "Perro","age": 1}
    And method post
    And status 201
    And def petId = $.data.id
    And url "http://localhost:3000/pets/" + petId
    When method delete
    Then status 204

  Scenario Outline: Create a new pet
    Given request {"name": "#(name)", "type": "#(type)","age": #(parseInt(age))}
    When method post
    Then status 201
    And match $.message contains "Pet created"
    Examples:
      | name    | type  | age |
      | Bluey 1 | Perro | 1   |
      | Bluey 2 | Gato  | 2   |
      | Bluey 3 | Loro  | 3   |
      | Bluey 4 | Oveja | 4   |
      | Bluey 5 | Perro | 5   |

  Scenario Outline: Create a new pet with <description>
    Given request {"name": "<name>", "type": "<type>","age": <age>}
    When method post
    Then status <status>
    And match $.message contains "<message>"
    Examples:
      | name                | type  | age | description       | status | message     |
      | Bluey 1 likhasjdcbp | Perro | 1   | long name         | 201    | Pet created |
      | Bluey 2 !!!         | Gato  | 2   | invalid character | 201    | Pet created |

  Scenario: Create a new dog reading and external file

    * def createANewPetRequest = read('classpath:request/createANewPet.json')
    * def respuesta = read('classpath:response/succesfullPetCreationResponse.json')

    Given request createANewPetRequest
    When method post
    Then status 201
    And match $.message contains "Pet created"
    And match response == respuesta

  Scenario: Create a new dog reading and external file as template

    * def name = 'Testing'
    * def type = 'Perro'
    * def age = 1

    * def createANewPetRequest = read('classpath:request/createANewPetTemplate.json')
    * def respuesta = read('classpath:response/succesfullPetCreationResponse.json')

    * print createANewPetRequest

    Given request createANewPetRequest
    When method post
    Then status 201
    And match $.message contains "Pet created"
    And match response == respuesta