package com.project_ecommerce_cm.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project_ecommerce_cm.entity.Autor;
import com.project_ecommerce_cm.repository.AutorRepository;

@RestController
@RequestMapping("/api/ecommerce/admin")
public class AutorControllerAPI {

	@Autowired
	AutorRepository autorRepository;

	@GetMapping("listarAutor")
	public List<Autor> ListarAutor() {
		List<Autor> autor = autorRepository.findAll();
		return autor;

	}

	@PostMapping("cadastrarAutor")
	public void cadastrarAutor(Autor autor) {
		autorRepository.save(autor);
	}

}
