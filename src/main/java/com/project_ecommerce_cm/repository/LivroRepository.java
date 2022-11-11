package com.project_ecommerce_cm.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project_ecommerce_cm.entity.Autor;
import com.project_ecommerce_cm.entity.Categoria;
import com.project_ecommerce_cm.entity.Editora;
import com.project_ecommerce_cm.entity.Livro;

@Repository
public interface LivroRepository extends JpaRepository<Livro, Integer> {

	List<Livro> findByDestaqueTrue();

	List<Livro> findByTituloContainingIgnoreCase(String titulo);

	List<Livro> findByAutor(Autor autor);

	List<Livro> findByCategoria(Categoria categoria);

	List<Livro> findByEditora(Editora editora);

}
