package com.project_ecommerce_cm.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Livro {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	private String titulo;
	private int paginas;
	@OneToOne
	private Autor autor;
	@OneToOne
	private Editora editora;
	@OneToOne
	private Categoria categoria;
	private String foto;
	private double preco;
	private boolean destaque;
	private boolean ativos;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public int getPaginas() {
		return paginas;
	}
	public void setPaginas(int paginas) {
		this.paginas = paginas;
	}
	public Autor getAutor() {
		return autor;
	}
	public void setAutor(Autor autor) {
		this.autor = autor;
	}
	public Editora getEditora() {
		return editora;
	}
	public void setEditora(Editora editora) {
		this.editora = editora;
	}
	public Categoria getCategoria() {
		return categoria;
	}
	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}
	public String getFoto() {
		return foto;
	}
	public void setFoto(String foto) {
		this.foto = foto;
	}
	public double getPreco() {
		return preco;
	}
	public void setPreco(double preco) {
		this.preco = preco;
	}
	public boolean isDestaque() {
		return destaque;
	}
	public void setDestaque(boolean destaque) {
		this.destaque = destaque;
	}
	public boolean isAtivos() {
		return ativos;
	}
	public void setAtivos(boolean ativos) {
		this.ativos = ativos;
	}
	
	

}
