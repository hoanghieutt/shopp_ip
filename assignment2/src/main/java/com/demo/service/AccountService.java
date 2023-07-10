package com.demo.service;

import com.demo.model.Account;
import com.demo.repository.AccountRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Service
public class AccountService {

    @Autowired
    AccountRepo accountRepo;

    public boolean login(String userName, String passWord) {
        Optional<Account> account = accountRepo.findById(userName);
        if (account.isPresent()) {
            if (account.get().getPassWord().equals(passWord)) {
                return true;
            }
        }
        return false;
    }

    public void save(Account account, MultipartFile image) throws IOException {
        if (!image.isEmpty()) {
            Resource resource = new ClassPathResource("/static/photos/");
            image.transferTo(new File(resource.getFile().getAbsolutePath() + "/" + image.getOriginalFilename()));
            account.setPhoto(image.getOriginalFilename());
        }
        accountRepo.save(account);
    }

    public List<Account> getAll() {
        return accountRepo.findAll();
    }

    public Account findById(String userName) {
        return accountRepo.getById(userName);
    }
}
