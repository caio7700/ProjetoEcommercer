package com.project_ecommerce_cm.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project_ecommerce_cm.entity.Livro;
import com.project_ecommerce_cm.repository.AutorRepository;
import com.project_ecommerce_cm.repository.CategoriaRepository;
import com.project_ecommerce_cm.repository.EditoraRepository;
import com.project_ecommerce_cm.repository.LivroRepository;

@Controller
public class LivroController {

	@Autowired
	LivroRepository livroRepository;
	
	@Autowired
	CategoriaRepository categoriaRepository;
	
	@Autowired
	EditoraRepository editoraRepository;
	
	@Autowired
	AutorRepository autorRepository;
	
	@GetMapping("/admin/cadastrarlivro")
	public ModelAndView form (Livro livro) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/admin/formLivro");
		modelAndView.addObject("categorias", categoriaRepository.findAll());
		modelAndView.addObject("autores", autorRepository.findAll());
		modelAndView.addObject("editoras", editoraRepository.findAll());
		return modelAndView;
	}
	
	@InitBinder    /* Converts empty strings into null when a form is submitted */
	public void initBinder(WebDataBinder binder) {  
	    binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));  
	}
	
	@PostMapping("/admin/livro")
	public ModelAndView create(MultipartFile foto1, @Valid Livro livro, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/cadastrarlivro");
		
		if(bindingResult.hasErrors()) {
			return form(livro);
		}
		
		livroRepository.save(livro);

		redirectAttributes.addFlashAttribute("msgm", "Livro Cadastrado Com Sucesso");
		return modelAndView;
	}
	
}
