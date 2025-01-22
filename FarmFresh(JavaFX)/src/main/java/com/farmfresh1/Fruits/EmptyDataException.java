package com.farmfresh1.Fruits;

public class EmptyDataException extends Exception{
    public EmptyDataException(String message){
        super (message);
    }
    public EmptyDataException(String message ,Throwable cause){
        super(message,cause);
    }
}