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
import com.project_ecommerce_cm.repository.AutorRepository;

@RestController
@RequestMapping("/api/ecommerce/admin/autor")
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

	@PutMapping("/update/{id}")
	public Autor update(@PathVariable Integer id, @RequestBody Autor body) {
		var antigoAutor = autorRepository.findById(id).get();

		antigoAutor.setDescricao(body.getDescricao());
		autorRepository.save(antigoAutor);
		return antigoAutor;

	}

	@DeleteMapping("/delete/{id}")
	public void delete(@PathVariable Integer id) {
		var autor = autorRepository.findById(id).get();
		autor.setAtivo(false);
		autorRepository.deleteById(id);
	}
}
