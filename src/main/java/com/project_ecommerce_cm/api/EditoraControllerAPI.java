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
import com.project_ecommerce_cm.entity.Editora;
import com.project_ecommerce_cm.repository.EditoraRepository;

@RestController
@RequestMapping("/api/ecommerce/admin/editora")
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

	@PutMapping("/update/{id}")
	public Editora update(@PathVariable Integer id, @RequestBody Editora body) {
		var antigaEditora = editoraRepository.findById(id).get();

		antigaEditora.setDescricao(body.getDescricao());
		editoraRepository.save(antigaEditora);
		return antigaEditora;

	}

	@DeleteMapping("/delete/{id}")
	public void delete(@PathVariable Integer id) {
		editoraRepository.deleteById(id);
		var editora = editoraRepository.findById(id).get();
		editora.setAtivo(false);
		editoraRepository.save(editora);
	}
}
