package features.support.utils;

import com.github.javafaker.Faker;

import java.util.Locale;

public class Utils {

    private static final Faker faker = new Faker(new Locale("en_US"));

    //used to generate fake username
    public static String generateRandomUsername() {
        return faker.name().username();
    }

//
//    //used to generate fake password, because the api said: "Passwords must have at least one non-alphanumeric character,
//    // one digit ('0'-'9'), one uppercase ('A'-'Z'), one lowercase ('a'-'z'),
//    // one special character and Password must be eight characters or longer."
//    //REF HERE: https://dius.github.io/java-faker/apidocs/index.html
//    public static String generateRandomPassword() {
//        return faker.internet().password(8, 10, true, true, true);
//    }
}