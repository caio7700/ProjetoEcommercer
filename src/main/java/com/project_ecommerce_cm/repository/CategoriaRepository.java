
package com.project_ecommerce_cm.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project_ecommerce_cm.entity.Categoria;
@Repository
public interface CategoriaRepository extends JpaRepository<Categoria, Integer> {

	List<Categoria> findByAtivoTrue();

}
