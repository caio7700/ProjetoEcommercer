package com.project_ecommerce_cm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.project_ecommerce_cm.entity.Livro;
import com.project_ecommerce_cm.repository.AutorRepository;
import com.project_ecommerce_cm.repository.CategoriaRepository;
import com.project_ecommerce_cm.repository.EditoraRepository;
import com.project_ecommerce_cm.repository.LivroRepository;

@Controller
public class CarroCompraController {

	
	@Autowired
	AutorRepository autorRepository;
	
	@Autowired
	CategoriaRepository categoriaRepository;
	
	@Autowired
	EditoraRepository editoraRepository;
	
	@Autowired
	LivroRepository livroRepository;
	
	@GetMapping("/carrinho/{id}")
	public ModelAndView carro(@PathVariable("id") Integer id, Livro livro){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("carrinho");
		modelAndView.addObject("livro", livroRepository.getById(id));
		modelAndView.addObject("msg", "Carrinho de Compras:");
		menuListaDLC(modelAndView);
		return modelAndView;
	}
	
	private void menuListaDLC(ModelAndView modelAndView) {
		modelAndView.addObject("autores", autorRepository.findAll());
		modelAndView.addObject("categorias", categoriaRepository.findAll());
		modelAndView.addObject("editoras", editoraRepository.findAll());
	}
}
