package com.example.shopapp.repository;

import com.example.shopapp.model.Product;
import org.hibernate.query.Page;
import org.springframework.data.jpa.repository.JpaRepository;

import java.awt.print.Pageable;

public interface ProductRepository extends JpaRepository<Product, Long> {
    boolean existsByName(String name);
//    Page<Product>findAll(Pageable pageable);
}
