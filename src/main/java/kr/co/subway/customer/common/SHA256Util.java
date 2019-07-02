package kr.co.subway.customer.common;

import java.security.MessageDigest;

import org.springframework.stereotype.Component;

@Component("SHA256Util")
public class SHA256Util {
	public String encData(String data) throws Exception{
		MessageDigest mDigest = MessageDigest.getInstance("SHA-256");
		mDigest.update(data.getBytes());
		byte[] msgStr = mDigest.digest();
		StringBuffer sbuf = new StringBuffer();
		for(int i=0; i<msgStr.length; i++) {
			byte tmpStrByte = msgStr[i];
			String tmpEncTxt = Integer.toString((tmpStrByte & 0xff)+0x100,16).substring(1);
			sbuf.append(tmpEncTxt);
		}
		System.out.println(sbuf.toString());
		return sbuf.toString();
	}
}
