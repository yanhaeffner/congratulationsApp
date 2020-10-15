package com.yanhaeffner.cloud.temafinal01.congratulationsApp.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value= HttpStatus.BAD_REQUEST, reason="Bad Parameter Input (name can not be empty)")
public class ServiceException extends RuntimeException{
    public ServiceException(String msg){
        super(msg);
    }
}
