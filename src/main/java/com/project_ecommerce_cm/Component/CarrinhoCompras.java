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

	private Integer getQuantidade(Livro livro) {
		if (!livros.containsKey(livro)) {
			return 1;
		} else
			return livros.get(livro) + 1;
	}

	public Integer getQuantidadeInteger(Livro livro) {
		if (!livros.containsKey(livro))
			return 1;
		else
			return livros.get(livro);

	}

	public Double getQuantidadeLivros(Livro livro) {
		return livro.getPreco()*getQuantidadeInteger(livro);
	}

	public Double getValorTotal() {
		Double total = 0.00;
		for (Livro livro : livros.keySet()) {
			total = total;
		}
		return total;
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
