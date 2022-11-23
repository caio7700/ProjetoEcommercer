package com.project_ecommerce_cm.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project_ecommerce_cm.entity.Autor;
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

	@PutMapping("/update/{id}")
	public Categoria update(@PathVariable Integer id, @RequestBody Categoria body) {
		var antigaCategoria = categoriaRepository.findById(id).get();

		antigaCategoria.setDescricao(body.getDescricao());
		categoriaRepository.save(antigaCategoria);
		return antigaCategoria;

	}

	@DeleteMapping("/delete/{id}")
	public void delete(@PathVariable Integer id) {
		categoriaRepository.deleteById(id);
	}
}
