package com.duucking.method;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EncodeAndVerify {

	// 字符串的加密(字符串和密钥)
	public static String encode(String str, String key) {
		byte[] digest = null;
		try {
			MessageDigest md5 = MessageDigest.getInstance("md5");
			digest = md5.digest((str + key).getBytes("utf-8"));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		// 16是表示转换为16进制数
		String md5Str = new BigInteger(1, digest).toString(16);
		return md5Str;
	}

	// 根据传入的密钥进行验证
	public static boolean verify(String text, String key, String md5) {
		String md5str = encode(text, key);
		if (md5str.equalsIgnoreCase(md5)) {
			return true;
		}
		return false;
	}

}
