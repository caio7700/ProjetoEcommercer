<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Import da taglib -->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title> LIVROS </title>
</head>
<body>
	<header>
		<nav>
			<a class="menu" href="/admin/listaLivro"> Lista de Livros </a>
		</nav>
	</header>
	<div class="container">
		<div class="card">
			<h1>Formulário:</h1>
			<p>${msgm}</p>
			<form:form action="${s:mvcUrl('LC#create').build()}" method="POST"
				modelAttribute="livro" enctype="multipart/form-data">
				<div class="div1">
					
					<label><b> Titulos </b></label>
					<form:errors path="titulo" />
					<form:input path="titulo" />
					
					<label><b>Paginas</b></label>
					<form:errors path="paginas" />
					<form:input path="paginas" />
					
					<label><b>Foto</b></label>
					<input name="foto1" type="file"/>
					
					<label><b>Preco</b></label>
					<form:errors path="preco" />
					<form:input path="preco" />
					<label><b>Categoria</b></label>
					
					<form:select path="categoria">
						<form:option value="NONE"> --SELECT--</form:option>
						<form:options items="${categorias}" itemLabel="nome" />
					</form:select>
					
					<label><b>Editora</b></label>
					<form:select path="editora">
						<form:option value="NONE"> --SELECT--</form:option>
						<form:options items="${editoras}" itemLabel="nome" />
					</form:select>
					
					<label><b>Autor</b></label>
					<form:select path="autor">
						<form:option value="NONE"> --SELECT--</form:option>
						<form:options items="${autores}" itemLabel="nome" />
					</form:select>
			
					
								
				</div>
				<button type="submit"> CADASTRAR </button>
			</form:form>
		</div>
	</div>
</body>
</html>