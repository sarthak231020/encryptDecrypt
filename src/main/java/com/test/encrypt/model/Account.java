package com.test.encrypt.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "Account")
public class Account {
	@Id
	@SequenceGenerator(name="id_sequence",sequenceName = "id_sequence",allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="id_sequence")
	private Long Id;
	

	@Column(name="accountNumber")
	private String accountNumber;
	

	public Account() {
		super();
	}

	

	public Account(String accountNumber, String type, String amount, String currency, String accountFrom) {
		super();
		this.accountNumber = accountNumber;
		this.type = type;
		this.amount = amount;
		this.currency = currency;
		this.accountFrom = accountFrom;
	}



	@Column(name="type")
	private String type;
	

	@Column(name="amount")
	private String  amount;
	

	@Column(name="currency")
	private String currency;
	

	@Column(name="accountFrom")
	private String accountFrom;





	/**
	 * @return the accountNumber
	 */
	public String getAccountNumber() {
		return accountNumber;
	}


	/**
	 * @param accountNumber the accountNumber to set
	 */
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}


	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}


	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}


	/**
	 * @return the amount
	 */
	public String getAmount() {
		return amount;
	}


	/**
	 * @param amount the amount to set
	 */
	public void setAmount(String amount) {
		this.amount = amount;
	}


	/**
	 * @return the currency
	 */
	public String getCurrency() {
		return currency;
	}


	/**
	 * @param currency the currency to set
	 */
	public void setCurrency(String currency) {
		this.currency = currency;
	}


	/**
	 * @return the accountFrom
	 */
	public String getAccountFrom() {
		return accountFrom;
	}


	/**
	 * @param accountFrom the accountFrom to set
	 */
	public void setAccountFrom(String accountFrom) {
		this.accountFrom = accountFrom;
	}
	
	
	
}
