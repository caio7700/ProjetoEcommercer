package com.project_ecommerce_cm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project_ecommerce_cm.entity.Autor;
import com.project_ecommerce_cm.entity.Categoria;
import com.project_ecommerce_cm.entity.Editora;
import com.project_ecommerce_cm.entity.Livro;
import com.project_ecommerce_cm.repository.AutorRepository;
import com.project_ecommerce_cm.repository.CategoriaRepository;
import com.project_ecommerce_cm.repository.EditoraRepository;
import com.project_ecommerce_cm.repository.LivroRepository;

@Controller
public class DetalhesLivroController {

	@Autowired
	AutorRepository autorRepository;
	
	@Autowired
	CategoriaRepository categoriaRepository;
	
	@Autowired
	EditoraRepository editoraRepository;
	
	@Autowired
	LivroRepository livroRepository;
	
	@GetMapping("/detalheslivro/{id}")
	public ModelAndView detalhes(@PathVariable("id") Integer id, Livro livro){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("detalhesLivro");
		modelAndView.addObject("livro", livroRepository.getById(id));
		modelAndView.addObject("msg", "Detalhes do Livro:");
		menuListaDLC(modelAndView);
		return modelAndView;
	}
	
	private void menuListaDLC(ModelAndView modelAndView) {
		modelAndView.addObject("autores", autorRepository.findAll());
		modelAndView.addObject("categorias", categoriaRepository.findAll());
		modelAndView.addObject("editoras", editoraRepository.findAll());
	}
	
}
