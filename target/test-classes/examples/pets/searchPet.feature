Feature: Search pets

  Scenario: Search a new dog
    * call read('createPet.feature@create_pet')

    Given url "http://localhost:3000/pets/" + petId
    And method get
    Then status 200