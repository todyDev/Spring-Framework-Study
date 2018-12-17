package com.tody.user.exception;

public class AlreadyExistingIdException extends RuntimeException {
	public AlreadyExistingIdException(String msg) {
		super(msg);
	}
}
