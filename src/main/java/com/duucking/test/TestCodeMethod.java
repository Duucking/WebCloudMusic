package com.duucking.test;

import com.duucking.method.EncodeAndVerify;

public class TestCodeMethod {

	private static String keyString = "加密密钥！";

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String password = "1357924680";
		String encodepassword = "";
		encodepassword = EncodeAndVerify.encode(password, keyString);
		System.out.println(encodepassword);
		if (EncodeAndVerify.verify(password, keyString, encodepassword)) {
			System.out.println("认证成功");
		}else {
			System.out.println("认证失败");
		}
	}

}
