package com.duucking.webservice;

import javax.jws.WebService;

@WebService
public class ServiceHello {
	public String sayHello(String name) {
		System.out.println("hello world!");
		return "welcome to java"+name;
	}

}
