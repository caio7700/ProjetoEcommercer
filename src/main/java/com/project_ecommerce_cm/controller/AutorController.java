package com.project_ecommerce_cm.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project_ecommerce_cm.entity.Autor;
import com.project_ecommerce_cm.repository.AutorRepository;


@Controller
public class AutorController {
	
	@Autowired
	AutorRepository autorRepository;
	
	@GetMapping("/admin/autor")
	public ModelAndView form(Autor autor) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/formAutor");
		return modelAndView;
	}
	
	@PostMapping("/admin/autor")
	public ModelAndView create(@Valid Autor autor, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/autor");
		
		if(bindingResult.hasErrors()) {
			return form(autor);
		}
		
		autorRepository.save(autor);

		redirectAttributes.addFlashAttribute("msgm", "Autor(a) Cadastrado(a) Com Sucesso");
		return modelAndView;
	}
	
	@GetMapping("/admin/listautor")
	public ModelAndView listAutor() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/listAutor");
		List<Autor> autores = autorRepository.findAll();
		modelAndView.addObject("listAutores", autores);
		return modelAndView;
	}
	
	@GetMapping("/inativarAutor/{id}")
	public ModelAndView inativarAutor(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/listautor");
		Autor autor = autorRepository.findById(id).get();
		autor.setAtivo(false);
		autorRepository.save(autor);
		//editoraRepository.delete(autor);	
		redirectAttributes.addFlashAttribute("msg", "Autor Inativado Com Sucesso");
		return modelAndView;
	}
	
	@GetMapping("/ativarAutor/{id}")
	public ModelAndView ativarAutor(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/listautor");
		Autor autor = autorRepository.findById(id).get();
		autor.setAtivo(true);
		autorRepository.save(autor);
		//editoraRepository.delete(autor);	
		redirectAttributes.addFlashAttribute("msg", "Autor Ativado Com Sucesso");
		return modelAndView;
	}
	
	@SuppressWarnings("deprecation")
	@GetMapping("/admin/editarA/{id}")
	public ModelAndView editarAutor(@PathVariable("id") Integer id, Autor autor, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/admin/editarAutor");
		autor = autorRepository.getById(id);
		modelAndView.addObject("autorEdit", autor);
		return modelAndView;
	}
	
	@PostMapping("/admin/editarAutor")
	public ModelAndView updateAutor(Autor autor, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/admin/listautor");

		@SuppressWarnings("deprecation")
		Autor autor1 = autorRepository.getById(autor.getId());
		autor1.setNome(autor.getNome());

		autorRepository.save(autor1);

		redirectAttributes.addFlashAttribute("msg", "Autor(a) editado(a) com sucesso");
		return modelAndView;
	}


}
