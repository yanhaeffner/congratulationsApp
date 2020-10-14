package com.yanhaeffner.cloud.final01.buildApp.service;

import com.yanhaeffner.cloud.final01.buildApp.exceptions.ServiceException;
import org.junit.Test;
import org.springframework.test.util.AssertionErrors;

public class CongratulationGeneratorTest {
    private CongratulationGenerator congratulationGenerator = new CongratulationGenerator();

    @Test
    public void getInvalidCongratulationMessage() {
        String congratulationMessage = "Congratulations, Yan! You've reached Tema Final #01";
        AssertionErrors.assertEquals("Messages should be equivalents", congratulationMessage, congratulationGenerator.congratulate("Yan"));
    }

    @Test(expected = ServiceException.class)
    public void getTotalTweetsInvalidUsernameTest() {
        congratulationGenerator.congratulate(null);
    }

}
