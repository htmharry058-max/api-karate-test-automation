package examples.pets;

import com.intuit.karate.junit5.Karate;

public class UpdatePetRunner {

    @Karate.Test
    Karate testUpdatePets() {
        return Karate.run("updatePet").relativeTo(getClass());
    }
}
