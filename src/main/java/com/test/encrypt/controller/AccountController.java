package com.test.encrypt.controller;

import java.nio.charset.StandardCharsets;
import java.security.DigestException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Base64;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.test.encrypt.model.Account;
import com.test.encrypt.repository.AccountRepo;


@Controller
public class AccountController {
	
	@Autowired
	private AccountRepo acRepo;
	
	
	
	public AccountController() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	public AccountController(AccountRepo acRepo) {
		super();
		this.acRepo = acRepo;
	}




	@GetMapping("/home")
	public String getHome() 
	{
		return "form";
	}
	
	 public static byte[][] GenerateKeyAndIV(int keyLength, int ivLength, int iterations, byte[] salt, byte[] password, MessageDigest md) {
	        int digestLength = md.getDigestLength();
	        int requiredLength = (keyLength + ivLength + digestLength - 1) / digestLength * digestLength;
	        byte[] generatedData = new byte[requiredLength];
	        int generatedLength = 0;
	        try {
	            md.reset();
	            // Repeat process until sufficient data has been generated
	            while (generatedLength < keyLength + ivLength) {
	                // Digest data (last digest if available, password data, salt if available)
	                if (generatedLength > 0)
	                    md.update(generatedData, generatedLength - digestLength, digestLength);
	                md.update(password);
	                if (salt != null)
	                    md.update(salt, 0, 8);
	                md.digest(generatedData, generatedLength, digestLength);
	                // additional rounds
	                for (int i = 1; i < iterations; i++) {
	                    md.update(generatedData, generatedLength, digestLength);
	                    md.digest(generatedData, generatedLength, digestLength);
	                }
	                generatedLength += digestLength;
	            }
	            // Copy key and IV into separate byte arrays
	            byte[][] result = new byte[2][];
	            result[0] = Arrays.copyOfRange(generatedData, 0, keyLength);
	            if (ivLength > 0)
	                result[1] = Arrays.copyOfRange(generatedData, keyLength, keyLength + ivLength);
	            return result;
	        } catch (DigestException e) {
	            throw new RuntimeException(e);
	        } finally {
	            // Clean out temporary data
	            Arrays.fill(generatedData, (byte)0);
	        }
	    }
	
	public String getDecrypted(String data) throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException
	{
		String secret = "Baktara";
		String cipherText1 = data;

		byte[] cipherData = Base64.getDecoder().decode(cipherText1);		
		byte[] saltData = Arrays.copyOfRange(cipherData, 8, 16);

		MessageDigest md5 = MessageDigest.getInstance("MD5");
		final byte[][] keyAndIV = GenerateKeyAndIV(32, 16, 1, saltData, secret.getBytes(StandardCharsets.UTF_8), md5);
		SecretKeySpec key = new SecretKeySpec(keyAndIV[0], "AES");
		IvParameterSpec iv = new IvParameterSpec(keyAndIV[1]);

		byte[] encrypted = Arrays.copyOfRange(cipherData, 16, cipherData.length);
		Cipher aesCBC = Cipher.getInstance("AES/CBC/PKCS5Padding");
		aesCBC.init(Cipher.DECRYPT_MODE, key, iv);
		byte[] decryptedData = aesCBC.doFinal(encrypted);
		String decryptedText1 = new String(decryptedData, StandardCharsets.UTF_8);
		return decryptedText1;
	}
	 
	@PostMapping("/submitdata")
	public String submitData(@ModelAttribute Account account) throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException
	{
//		System.out.println(account.getAccountFrom());
//		System.out.println(account.getAccountNumber());
//		System.out.println(account.getCurrency());
//		System.out.println(account.getType());
//		System.out.println(account.getAmount());
		
		account.setAccountFrom(getDecrypted(account.getAccountFrom()));
		account.setAccountNumber(getDecrypted(account.getAccountNumber()));
		account.setCurrency(getDecrypted(account.getCurrency()));
		account.setType(getDecrypted(account.getType()));
		account.setAmount(getDecrypted(account.getAmount()));
		
		acRepo.save(account);
		return "successful";
	}
}
