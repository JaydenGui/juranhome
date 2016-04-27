///*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// * user login and register controller
// * ==========================================================+
// * @author fangzhigang
// * ==========================================================+
// * @date：2015-12-11 10:11
// * =========================================================*/
//package com.adsk.mp.controller;
//
//import java.io.IOException;
//import java.io.UnsupportedEncodingException;
//import java.security.InvalidKeyException;
//import java.security.NoSuchAlgorithmException;
//import java.security.SignatureException;
//import java.text.ParseException;
//import java.util.HashMap;
//import java.util.Map;
//import java.util.Properties;
//import java.util.UUID;
//
//import javax.crypto.spec.SecretKeySpec;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.apache.log4j.Logger;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.adsk.mp.commons.PropUtil;
//import com.nimbusds.jose.JOSEException;
//import com.nimbusds.jose.JWSAlgorithm;
//import com.nimbusds.jose.JWSHeader;
//import com.nimbusds.jose.JWSObject;
//import com.nimbusds.jose.JWSSigner;
//import com.nimbusds.jose.Payload;
//import com.nimbusds.jose.crypto.MACSigner;
//import com.nimbusds.jwt.JWTClaimsSet;
//
//import sun.misc.BASE64Encoder;
//
///**
// * Return login page method
// */
//
//@Controller
//public class TestEncode {
//	private Logger logger = Logger.getLogger(getClass());
//
//	/**
//	 * todo login
//	 * @throws JOSEException 
//	 * @throws UnsupportedEncodingException 
//	 * @throws ParseException 
//	 * @throws JWTVerifyException
//	 * @throws IOException
//	 * @throws SignatureException
//	 * @throws IllegalStateException
//	 * @throws NoSuchAlgorithmException
//	 * @throws InvalidKeyException
//	 */
//	@RequestMapping(value = "/testEncode", method = RequestMethod.GET)
//	@ResponseBody
//	public String DataCollector(HttpServletRequest request, HttpServletResponse response) throws JOSEException, UnsupportedEncodingException, ParseException, NoSuchAlgorithmException, InvalidKeyException {
//		System.err.println("------------------------------------------- DataCollector -----------------------------------------");
//		Properties p = PropUtil.getProperty("SSO.properties");
//		
//		String AccessToken = "154c2c1d-9297-4346-b8fb-b0716f05e24f";
//		Long AccessTokenExpiredAt = Long.parseLong("145655948635");
////		String AccessTokenExpiredAt = "145655948635";
//		
//		com.alibaba.fastjson.JSONObject JsonHeader = new com.alibaba.fastjson.JSONObject();
//		JsonHeader.put("alg", "HS256");
//		JsonHeader.put("typ", "JWT");
//		String EncedeHeader = null;
//		EncedeHeader= new BASE64Encoder().encode(JsonHeader.toJSONString().getBytes());
//		
//		com.alibaba.fastjson.JSONObject JsonBody = new com.alibaba.fastjson.JSONObject();
//		JsonBody.put("Access_token", AccessToken);
//		JsonBody.put("Access_token_expired_at", AccessTokenExpiredAt);
//		String EncedeBody = null;
//		EncedeBody= new BASE64Encoder().encode(JsonBody.toJSONString().getBytes());
//		
////		String Secret = new BASE64Encoder().encode("juranzaixian".getBytes());
//		//String Result = JWT_decoder.encryptHMAC(JsonHeader.toJSONString() + "." + JsonBody.toJSONString(), "juranzaixian");
//		
//		String algo = "HmacSHA256";
////		 String secret = "065493570096ab369f4b120f07deabb67299ab1480dd030f20ba47245306ad91";
//		 String secret = "juranzaixian";
//		 SecretKeySpec sk = new SecretKeySpec(secret.getBytes(), algo);
//
//		Map<String, Object> payload = new HashMap<String , Object>();
//		payload.put("Access_token", AccessToken);
//		payload.put("Access_token_expired_at", AccessTokenExpiredAt);
//
//		//ClaimsSet  jwtClaims = new ClaimsSet();
//		JWTClaimsSet jwtClaims = new JWTClaimsSet();
//
//		//jwtClaims.setJWTIDClaim(UUID.randomUUID().toString());
//		jwtClaims.setJWTID(UUID.randomUUID().toString());
//
//        for (Map.Entry<String, Object> entry : payload.entrySet()){
//
//           jwtClaims.setCustomClaim(entry.getKey(), entry.getValue());
//
//        }
//
//        JWSHeader header = new JWSHeader(JWSAlgorithm.HS256); 
//
//        // Create JWS object
//        JWSObject jwsObject = new JWSObject(header, new Payload(jwtClaims.toJSONObject()));
//
//        // Create HMAC signer
//        JWSSigner signer = new MACSigner("juranzaixian".getBytes()); 
//
//        jwsObject.sign(signer);
//
//
//        // Serialise to JWT compact form
//
//        String s = jwsObject.serialize();
//		
//		System.out.println("Resuolt ======================================== " + s);
//		
//		
////		byte[] byteHeader = JsonHeader.getBytes(JsonHeader.toJSONString());
////		String EncedeHeader = (new BASE64Encoder()).encodeBuffer(byteHeader);
//		
//		System.out.println("EncedeHeader ------------------------------------------> " + EncedeHeader);
//		System.out.println("EncedeBody ------------------------------------------> " + EncedeBody);
//		//System.out.println("Secret ------------------------------------------> " + Secret);
//		
//		return s;
//	}
//}
//
