package com.demo.service;

import com.demo.model.Product;
import com.demo.repository.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class ProductService {

    @Autowired
    ProductRepo productRepo;

    public void save(Product product, MultipartFile image) throws IOException {
        if (!image.isEmpty()) {
            Resource resource = new ClassPathResource("/static/images/");
            image.transferTo(new File(resource.getFile().getAbsolutePath() + "/" + image.getOriginalFilename()));
            product.setImage(image.getOriginalFilename());
        }
        productRepo.save(product);
    }

    public Page<Product> findAllProductBy(String name, String categoryId, int minPrice, int maxPrice, int page) {
        Pageable pageable = PageRequest.of(page, 2);
        return productRepo.findAllProductBy("%" + name + "%", "%" + categoryId + "%", minPrice, maxPrice, pageable);
    }

    public List<Product> getAll() {
        return productRepo.findAll();
    }

    public Product findById(String id) {
        return productRepo.getById(id);
    }
}
