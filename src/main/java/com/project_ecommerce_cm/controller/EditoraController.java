package com.project_ecommerce_cm.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project_ecommerce_cm.entity.Editora;
import com.project_ecommerce_cm.repository.EditoraRepository;

@Controller
public class EditoraController {
	
	@Autowired
	EditoraRepository editoraRepository;
	
	@GetMapping("/admin/editora")
	public ModelAndView form(Editora editora) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/formEditora");
		return modelAndView;
	}
	
	@PostMapping("/admin/editora")
	public ModelAndView create(@Valid Editora editora, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/editora");
		
		if(bindingResult.hasErrors()) {
			return form(editora);
		}
		
		editoraRepository.save(editora);

		redirectAttributes.addFlashAttribute("msgm", "Editora Cadastrada Com Sucesso");
		return modelAndView;
	}

}
