package com.project_ecommerce_cm.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project_ecommerce_cm.entity.Categoria;
import com.project_ecommerce_cm.repository.CategoriaRepository;

@RestController
@RequestMapping("/api/ecommerce/admin")
public class CategoriaControllerAPI {

	@Autowired
	CategoriaRepository categoriaRepository;

	@GetMapping("listarCategoria")
	public List<Categoria> listarCategoria() {
		List<Categoria> categoria = categoriaRepository.findAll();
		return categoria;

	}

	@PostMapping("cadastrarCategoria")
	public void cadastrarCategoria(Categoria categoria) {
		categoriaRepository.save(categoria);
	}

}
