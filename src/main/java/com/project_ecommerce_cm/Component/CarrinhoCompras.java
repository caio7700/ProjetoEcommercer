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

	public void removerLivro(Livro livro) {
		livros.remove(livro);
		
	}
}
