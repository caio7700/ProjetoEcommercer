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
<title>Formulário de Editora</title>
</head>
<body>
	<header>
		<nav class="navbar bg-dark navbar-dark">
			<div class="container-fluid">
				<a href="/" class="link-logo" style="color: white;"><span
					class="navbar-brand mb-0 h1">BOOKFLIX</span></a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#menu"
					style="cursor: pointer;" aria-expanded="true">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="navbar-collapse collapse" id="menu">
					<ul class="nav justify-content-center">
						<li class="nav-item"><a class="nav-link" href="/admin/autor">Cadastro
								de Autores</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/admin/listautor">Lista de Autores</a></li>

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
			<h3 class="card-header">Formulário de Editora:</h3>
			<form:form action="${s:mvcUrl('EC#create').build()}" method="POST"
				modelAttribute="editora" enctype="multipart/form-data">
				<div class="card-body">
					<label class="col-sm-2 col-form-label"><b>Nome</b></label>
					<form:input path="nome" class="form-control" />
					<p style="color: green;">${msgm}</p>
					<form:errors path="nome" style="color: red;" />
				</div>
				<div class="card-body">
					<button type="submit" class="btn btn-outline-primary"
						style="-bs-btn-padding-y: .55rem; - -bs-btn-padding-x: .5rem; - -bs-btn-font-size: .95rem;">CADASTRAR</button>
				</div>
			</form:form>
		</div>
	</div>

	<footer class="card text-bg-dark mb-3"
		style="max-width: 80rem; margin-top: 240px;">
		<div class="card-header" style="padding-left: 557px;">
			<h4>BooKFliX</h4>
		</div>
		<div class="card-body">
			<h5 class="card-title" style="padding-left: 535px;">Producted By</h5>
			<p class="card-text" style="padding-left: 500px;">Caio Rocha e
				Max Pinheiro</p>
		</div>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>