package com.yanhaeffner.cloud.final01.buildApp.service;

import com.yanhaeffner.cloud.final01.buildApp.exceptions.ServiceException;
import org.springframework.stereotype.Component;

@Component
public class CongratulationGenerator {
    public String congratulate(String name){
        if(name == null || name.trim().isEmpty()) throw new ServiceException("# Your name can not be empty");
        return "Congratulations, "+name+"! You've reached Tema Final #01";
    }
}
