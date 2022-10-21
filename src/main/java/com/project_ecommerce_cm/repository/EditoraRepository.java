package com.project_ecommerce_cm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project_ecommerce_cm.entity.Editora;
@Repository
public interface EditoraRepository extends JpaRepository<Editora, Integer>{

}
