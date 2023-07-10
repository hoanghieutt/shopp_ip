package com.demo.service;

import com.demo.model.Category;
import com.demo.repository.CategoryRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

//TODO: Connect to database

@Service
public class CategoryService {

    @Autowired
    CategoryRepo categoryRepo;

    public void save(Category category, String name) {
        category.setName(name);
        categoryRepo.save(category);
    }

    public List<Category> getAll() {
        return categoryRepo.findAll();
    }

    public Category findByid(String id) {
        return categoryRepo.getById(id);
    }
}
