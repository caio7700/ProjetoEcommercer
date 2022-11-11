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
public class HomeController {
	
	@Autowired
	AutorRepository autorRepository;
	
	@Autowired
	CategoriaRepository categoriaRepository;
	
	@Autowired
	EditoraRepository editoraRepository;
	
	@Autowired
	LivroRepository livroRepository;
	
	@GetMapping("/")
	public ModelAndView index(Livro livro){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("index");
		modelAndView.addObject("livros", livroRepository.findByDestaqueTrue());
		menuLista(modelAndView);
		return modelAndView;
	}

	private void menuLista(ModelAndView modelAndView) {
		modelAndView.addObject("autores", autorRepository.findAll());
		modelAndView.addObject("categorias", categoriaRepository.findAll());
		modelAndView.addObject("editoras", editoraRepository.findAll());
	}
	
	@PostMapping("/buscartitulo")
	public ModelAndView buscaTitulo(Livro livro){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("index");
		modelAndView.addObject("livros", livroRepository.findByTituloContainingIgnoreCase(livro.getTitulo()));
		menuLista(modelAndView);
		return modelAndView;
	}
	
	@GetMapping("/buscarAutor/{id}")
	public ModelAndView buscaPorAutor(@PathVariable("id") Integer id, Livro livro){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("index");
		Autor autor = autorRepository.getById(id);
		modelAndView.addObject("livros", livroRepository.findByAutor(autor));
		menuLista(modelAndView);
		return modelAndView;
	}
	
	@GetMapping("/buscarCategoria/{id}")
	public ModelAndView buscaPorCategoria(@PathVariable("id") Integer id, Livro livro){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("index");
		Categoria categoria = categoriaRepository.getById(id);
		modelAndView.addObject("livros", livroRepository.findByCategoria(categoria));
		menuLista(modelAndView);
		return modelAndView;
	}
	@GetMapping("/buscarEditora/{id}")
	public ModelAndView buscaPorEditora(@PathVariable("id") Integer id, Livro livro){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("index");
		Editora editora = editoraRepository.getById(id);
		modelAndView.addObject("livros", livroRepository.findByEditora(editora));
		menuLista(modelAndView);
		return modelAndView;
	}
}
