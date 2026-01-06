package examples.pets;

import com.intuit.karate.junit5.Karate;

public class CreatePetRunner {

    @Karate.Test
    Karate testCreatePets() {
        return Karate.run("createPet").relativeTo(getClass());
    }
}
