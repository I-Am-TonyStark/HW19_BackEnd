package com.mamalimomen.base.utilities;

public class InValidDataException extends Exception {
    public InValidDataException() {
        super("Wrong entered data format!");
    }

    public InValidDataException(String message) {
        super("Wrong entered data format for " + message + "!");
    }

    public InValidDataException(Throwable cause) {
        super(cause);
    }

    public InValidDataException(String message, Throwable cause) {
        super("Wrong entered data format for " + message + "!", cause);
    }
}
