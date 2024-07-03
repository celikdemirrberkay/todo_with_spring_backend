package com.berkay.app;

enum Messages {

    NOT_EXIST("Todo is not exist !"),
    DELETED("Todo successfully deleted !"),
    UPDATED("Todo successfully updated !");

    private final String message;

    Messages(String message){
        this.message = message;
    }

    public String getMessage (){
        return message;
    }
}

