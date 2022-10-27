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
	
	@GetMapping("/admin/listeditora")
	public ModelAndView listEditora() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/listEditora");
		List<Editora> editoras = editoraRepository.findAll();
		modelAndView.addObject("listEditoras", editoras);
		return modelAndView;
	}
	
	@GetMapping("/inativarEditora/{id}")
	public ModelAndView inativarEditora(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/listeditora");
		Editora editora = editoraRepository.findById(id).get();
		editora.setAtivo(false);
		editoraRepository.save(editora);
		//editoraRepository.delete(editora);	
		redirectAttributes.addFlashAttribute("msg", "Editora Inativada Com Sucesso");
		return modelAndView;
	}
	
	@GetMapping("/ativarEditora/{id}")
	public ModelAndView ativarEditora(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/listeditora");
		Editora editora = editoraRepository.findById(id).get();
		editora.setAtivo(true);
		editoraRepository.save(editora);
		//editoraRepository.delete(editora);	
		redirectAttributes.addFlashAttribute("msg", "Editora Ativada Com Sucesso");
		return modelAndView;
	}
	
	@SuppressWarnings("deprecation")
	@GetMapping("/admin/editarE/{id}")
	public ModelAndView editarEditora(@PathVariable("id") Integer id, Editora editora, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/admin/editarEditora");
		editora = editoraRepository.getById(id);
		modelAndView.addObject("editoraEdit", editora);
		return modelAndView;
	}
	
	@PostMapping("/admin/editarEditora")
	public ModelAndView updateEditora(@Valid Editora editora, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/admin/listeditora");

		@SuppressWarnings("deprecation")
		Editora editora1 = editoraRepository.getById(editora.getId());
		editora1.setNome(editora.getNome());
		
		if(bindingResult.hasErrors()) {
			return editarEditora(editora1.getId(), editora1, redirectAttributes);
		}

		editoraRepository.save(editora1);

		redirectAttributes.addFlashAttribute("msg", "Editora editado(a) com sucesso");
		return modelAndView;
	}

}
