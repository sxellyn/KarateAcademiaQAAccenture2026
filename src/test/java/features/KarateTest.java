package features;

//generate the reports of the tests results:
import com.intuit.karate.Results;

// the actual runner:
import com.intuit.karate.Runner;

//uses Junit to start the karate runner
import static org.junit.jupiter.api.Assertions.*;

//whatever is inside this tag is a test and must be executed amidst Junit
import org.junit.jupiter.api.Test;

public class KarateTest {

    @Test
    void testParallel() {
        Results results = Runner
                .path("classpath:features").tags("@user,@token,@books")
                .parallel(2);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}