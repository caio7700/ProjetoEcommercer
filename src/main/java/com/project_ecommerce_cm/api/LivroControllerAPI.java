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
import com.project_ecommerce_cm.entity.Livro;
import com.project_ecommerce_cm.repository.LivroRepository;

@RestController
@RequestMapping("/api/ecommerce/admin/livro")
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

	@PutMapping("/update/{id}")
	public Livro update(@PathVariable Integer id, @RequestBody Livro body) {
		var antigoLivro = livroRepository.findById(id).get();

		antigoLivro.setDescricao(body.getDescricao());
		livroRepository.save(antigoLivro);
		return antigoLivro;

	}

	@DeleteMapping("/delete/{id}")
	public void delete(@PathVariable Integer id) {
		var livro = livroRepository.findById(id).get();
		livro.setAtivo(false);
		livro.setDestaque(false);
		livroRepository.save(livro);
	}
}
