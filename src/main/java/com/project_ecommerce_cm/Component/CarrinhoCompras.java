package com.project_ecommerce_cm.Component;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

import com.project_ecommerce_cm.entity.Livro;

@Component
@Scope(value = WebApplicationContext.SCOPE_SESSION)
public class CarrinhoCompras {

	Map<Livro, Integer> livros = new LinkedHashMap<>();

	public Collection<Livro> getLivros() {
		return livros.keySet();
	}

	public void adicionarLivro(Livro livro) {
		livros.put(livro, getQuantidade(livro));
	}

	public Integer getQuantidade(Livro livro) {
		if (!livros.containsKey(livro)) {
			return 1;
		} else
			return livros.get(livro) + 1;
	}	


	public double getValorTotal() {
		double total = 0.00;
		for (Livro livro : livros.keySet()) {
			total += livro.subtotal(getQuantidade(livro));
		}
		return total;
	}
	
	public double getSubTotal (Livro livro) {
		return livro.subtotal(getQuantidade(livro));
	}

	public void removerLivro(Livro livro) {
		if(livros.containsKey(livro))
			livros.remove(livro);
	}

	public void update(Livro livro, Integer quantidade) {
		livros.put(livro, quantidade);
	}

	public void limparCarrinho() {
		livros.clear();
		
	}
}
