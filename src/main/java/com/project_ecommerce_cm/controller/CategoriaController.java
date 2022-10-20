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
import com.project_ecommerce_cm.entity.Categoria;
import com.project_ecommerce_cm.repository.AutorRepository;
import com.project_ecommerce_cm.repository.CategoriaRepository;

@Controller
public class CategoriaController {

	@Autowired
	CategoriaRepository categoriaRepository;

	@GetMapping("/admin/categoria")
	public ModelAndView form(Categoria categoria) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/formCategoria");
		return modelAndView;
	}

	@PostMapping("/admin/categoria")
	public ModelAndView create(@Valid Categoria categoria, BindingResult bindingResult,
			RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/categoria");

		if (bindingResult.hasErrors()) {
			return form(categoria);
		}

		categoriaRepository.save(categoria);

		redirectAttributes.addFlashAttribute("msgm", "Categoria(a) Cadastrado(a) Com Sucesso");
		return modelAndView;

	}

	@GetMapping("/admin/listacategoria")
	public ModelAndView listaCategoria() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/listaCategoria");
		List<Categoria> categorias = categoriaRepository.findAll();
		modelAndView.addObject("listaCategoria", categorias);
		return modelAndView;

	}

	@GetMapping("/excluirCategoria/{id}")
	public ModelAndView excluirCategoria(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/listcategoria");
		Categoria categoria = categoriaRepository.findById(id).get();
		categoriaRepository.delete(categoria);
		redirectAttributes.addFlashAttribute("msg", "Categoria(a) Apagado(a) Com Sucesso");
		return modelAndView;
	}

	@SuppressWarnings("deprecation")
	@GetMapping("/admin/editarcategoria/{id}")
	public ModelAndView editarCategoria(@PathVariable("id") Integer id, Categoria categoria,
			RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("editarCategoria");
		categoria = categoriaRepository.getById(id);
		modelAndView.addObject("categoriaEdit", categoria);
		return modelAndView;
	}

}