package com.test.encrypt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.test.encrypt.model.Account;

public interface AccountRepo extends JpaRepository<Account,Long> 
{

}
