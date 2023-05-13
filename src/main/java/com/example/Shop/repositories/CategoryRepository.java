package com.example.Shop.repositories;

import com.example.Shop.models.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {
    com.example.Shop.models.Category findByName(String name);
}
