package com.yanhaeffner.cloud.temafinal01.congratulationsApp.controller;

import com.yanhaeffner.cloud.temafinal01.congratulationsApp.service.CongratulationGenerator;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/congratulations")
public class CongratulationController {
    private final CongratulationGenerator congratulationGenerator;

    public CongratulationController(CongratulationGenerator congratulationGenerator){
        this.congratulationGenerator = congratulationGenerator;
    }

    @GetMapping("/{name}")
    @ResponseBody
    public String getCongratulations(@PathVariable(value = "name") String name)
    {
        return congratulationGenerator.congratulate(name);
    }
}