package com.project_ecommerce_cm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.project_ecommerce_cm.entity.Livro;
import com.project_ecommerce_cm.repository.LivroRepository;

@Controller
public class CarrinhoComprasController {

	@Autowired
	LivroRepository livroRepository;

	@Autowired
	com.project_ecommerce_cm.Component.CarrinhoCompras carrinhoCompras;

	@GetMapping("/carrinho/{id}")
	public ModelAndView CarrinhoCompras(@PathVariable("id") Integer id) {

		ModelAndView modelAndView = new ModelAndView("carrinhoCompras");
		Livro livro = livroRepository.getById(id);
		carrinhoCompras.adicionarLivro(livro);
		
		return modelAndView;
	}

}