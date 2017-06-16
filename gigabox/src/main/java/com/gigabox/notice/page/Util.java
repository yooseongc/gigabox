package com.gigabox.notice.page;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Util {
	public static int nvl(String text) {
		return nvl(text, 0);
		/*
		 * nvl()는 문자열을 숫자로 변환하는 메소드
		 * 
		 * @param (숫자로 변환할 문자열. 초기값으로 쓸 값)
		 */
	}

	public static int nvl(String text, int def) {
		int ret = def;
		try {
			ret = Integer.parseInt(text);
		} catch (Exception e) {
			ret = def;
		}
		return ret;
	}

	public static String nvl(Object text, String def) {
		if (text == null || "".equals(text.toString().trim())) {
			return def;
		} else {
			return text.toString();
		}
	}

	/*public static boolean verify(String pwdPolicy, String password) {
		Pattern pattern = Pattern.compile(pwdPolicy);
		Matcher matcher = pattern.matcher(password);
		return matcher.matches();
	}*/
}
