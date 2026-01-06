package examples.pets;

import com.intuit.karate.junit5.Karate;

public class SearchPetRunner {

    @Karate.Test
    Karate testSearchPets() {
        return Karate.run("searchPet").relativeTo(getClass());
    }
}
