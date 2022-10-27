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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<title>Document</title>
</head>
<body>
	<header>
		<nav class="navbar bg-dark navbar-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="#"> <img
					src="/resources/imgCSS/imgLogo.jpg" style="width: 50px;" />
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#menu"
					style="cursor: pointer;" aria-expanded="true">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="navbar-collapse collapse" id="menu">
					<ul class="nav justify-content-center">
						<li class="nav-item"><a class="nav-link"
							href="/admin/listautor">Lista de Autores</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/admin/editora">Cadastro de Editora</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/admin/listeditora">Lista de Editoras</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/admin/categoria">Cadastro de Categoria</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/admin/listacategoria">Lista de Categorias</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/admin/cadastrarlivro">Cadastro de Livro</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/admin/listalivro">Lista de Livros</a></li>
					</ul>
				</div>

			</div>
		</nav>
	</header>
	<div class="container">
		<div class="card">
			<h3 class="card-header">Formulário:</h3>
			<form:form action="${s:mvcUrl('AC#create').build()}" method="POST"
				modelAttribute="autor" enctype="multipart/form-data">
				<div class="card-body">
					<label class="col-sm-2 col-form-label" for="validationServerUsername"><b>Nome</b></label>
					<form:input path="nome" class="form-control" />
					<p style="color: green;">${msgm}</p>
					<form:errors path="nome" style="color: red;"/>
				</div>
				<div class="card-body">
					<button type="submit" class="btn btn-outline-primary"
						style="-bs-btn-padding-y: .55rem; - -bs-btn-padding-x: .5rem; - -bs-btn-font-size: .95rem;">CADASTRAR</button>
				</div>
			</form:form>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>