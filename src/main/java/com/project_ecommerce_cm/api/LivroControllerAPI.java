package com.project_ecommerce_cm.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project_ecommerce_cm.entity.Livro;
import com.project_ecommerce_cm.repository.LivroRepository;

@RestController
@RequestMapping("/api/ecommerce/admin")
public class LivroControllerAPI {

	@Autowired
	LivroRepository livroRepository;

	@GetMapping("/listarLivro")
	public List<Livro> listaLivro() {
		List<Livro> livro = livroRepository.findAll();
		return livro;
	}

	@PostMapping("/cadastrarLivro")
	public void cadastrarLivro(Livro livro) {
		livroRepository.save(livro);
	}

}
