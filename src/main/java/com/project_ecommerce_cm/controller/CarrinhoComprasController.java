package com.project_ecommerce_cm.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.UUID;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import com.project_ecommerce_cm.entity.Livro;
import com.project_ecommerce_cm.repository.AutorRepository;
import com.project_ecommerce_cm.repository.CategoriaRepository;
import com.project_ecommerce_cm.repository.EditoraRepository;
import com.project_ecommerce_cm.repository.LivroRepository;

@Controller
@Scope(value = WebApplicationContext.SCOPE_REQUEST)
public class CarrinhoComprasController {
	
	@Autowired
	AutorRepository autorRepository;
	
	@Autowired
	CategoriaRepository categoriaRepository;
	
	@Autowired
	EditoraRepository editoraRepository;

	@Autowired
	LivroRepository livroRepository;

	@Autowired
	com.project_ecommerce_cm.Component.CarrinhoCompras carrinhoCompras;
	
	Random gerador = new Random();
	
	@GetMapping("/carrinho")
	public ModelAndView carrinhoCompra() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("carrinho");
		modelAndView.addObject("livrosCarrinho", carrinhoCompras.getLivros());
		return modelAndView;
	}

	@GetMapping("/carrinho/{id}")
	public ModelAndView carrinhoCompras(@PathVariable("id") Integer id) {
		ModelAndView modelAndView = new ModelAndView("redirect:/carrinho");
		Livro livro = livroRepository.findById(id).get();
		carrinhoCompras.adicionarLivro(livro);
		modelAndView.addObject("livrosCarrinho", carrinhoCompras.getLivros());	
		return modelAndView;
	}
	
	@GetMapping("/carrinhoaddquantidade")
	public ModelAndView addQuantidade (@PathVariable("id") Integer id) {
		
		ModelAndView modelAndView = new ModelAndView("redirect:/carrinho");
		Livro livro = livroRepository.findById(id).get();
		carrinhoCompras.getQuantidade(livro);
		return modelAndView;
	}
	
	@GetMapping("/carrinhoadicionarlivro/{id}")
	public ModelAndView adicionarLivro (@PathVariable("id") Integer id) {
		ModelAndView modelAndView = new ModelAndView("carrinho");
		Livro livro = livroRepository.findById(id).get();
		carrinhoCompras.adicionarLivro(livro);
		modelAndView.addObject("itensCarrinho", carrinhoCompras.getLivros());
		return modelAndView;
		
	}
	
	@PostMapping("/carrinho/atualizar")
	public ModelAndView atualizar(Integer id, Integer quantidade) {
		Livro livro = livroRepository.findById(id).get();
		carrinhoCompras.update(livro, quantidade);
		return new ModelAndView("redirect:/carrinho");	
	}
	
	
	@GetMapping("/carrinhoremover/{id}")
	public ModelAndView remover(@PathVariable("id") Integer id) {

		ModelAndView modelAndView = new ModelAndView("redirect:/carrinho");
		Livro livro = livroRepository.findById(id).get();
		carrinhoCompras.removerLivro(livro);
		
		return modelAndView;
	}
	

	
	@GetMapping("/pagamento")
	public ModelAndView pagamento() {
		List<Livro> livros = new ArrayList<Livro>();
		ModelAndView modelAndView = new ModelAndView("/pagamento");
		UUID uuid = UUID.randomUUID();
		modelAndView.addObject("numeroPedido", uuid);
		Collection<Livro> livrosComprados = carrinhoCompras.getLivros();
	    livrosComprados.forEach(livro-> livros.add(livro));
		modelAndView.addObject("livrosPagos", livros);
		carrinhoCompras.limparCarrinho();
		
		return modelAndView;
	}
	

}
