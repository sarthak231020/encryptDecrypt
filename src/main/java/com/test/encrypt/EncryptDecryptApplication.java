package com.test.encrypt;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;

@SpringBootApplication
public class EncryptDecryptApplication extends ServletInitializer 
{

	public static void main(String[] args) {
		SpringApplication.run(EncryptDecryptApplication.class, args);
	}


}
