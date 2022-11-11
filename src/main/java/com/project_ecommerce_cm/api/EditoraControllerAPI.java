package com.project_ecommerce_cm.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project_ecommerce_cm.entity.Editora;
import com.project_ecommerce_cm.repository.EditoraRepository;

@RestController
@RequestMapping("/api/ecommerce/admin")
public class EditoraControllerAPI {

	@Autowired
	EditoraRepository editoraRepository;

	@GetMapping("/listarEditora")
	public List<Editora> listarEditora() {
		List<Editora> editora = editoraRepository.findAll();
		return editora;
	}

	@PostMapping("/cadastrarEditora")
	public void cadastrarEditora(Editora editora) {
		editoraRepository.save(editora);
	}

}
