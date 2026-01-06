package examples.pets;

import com.intuit.karate.junit5.Karate;

public class DeletePetRunner {

    @Karate.Test
    Karate testDeletePets() {
        return Karate.run("deletePet").relativeTo(getClass());
    }
}
