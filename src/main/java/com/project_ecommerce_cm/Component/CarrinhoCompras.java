package com.project_ecommerce_cm.Component;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.project_ecommerce_cm.entity.Livro;

@Component
public class CarrinhoCompras {

	Map<Livro, Integer> livros = new LinkedHashMap<>();

	public Collection<Livro> getLivros() {
		return livros.keySet();
	}

	public void adicionarLivro(Livro criaLivro) {
		livros.put(criaLivro, getQuantidade(criaLivro));
	}

	private int getQuantidade(Livro livro) {
		if (!livros.containsKey(livro)) {
			return 1;
		} else {
			return livros.get(livro) + 1;
		}

	}
}
