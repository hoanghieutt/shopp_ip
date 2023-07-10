package com.demo.repository;

import com.demo.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepo extends JpaRepository<Product, String> {


    @Query("select p from Product p Where p.name like ?1 " +
            "and p.category.id like ?2 " +
            "and p.price between ?3 and ?4")
    Page<Product> findAllProductBy(String name, String categoryId, int minPrice, int maxPrice, Pageable pageable);

}
