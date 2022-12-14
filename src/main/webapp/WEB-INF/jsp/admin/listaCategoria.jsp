<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Import da taglib -->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<title>Lista de Categorias</title>
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
								de Autor</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/admin/listautor">Lista de Autores</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/admin/editora">Cadastro de Editora</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/admin/listeditora">Lista de Editora</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/admin/categoria">cadastro de Categoria</a></li>

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
			<h2>Tabela de Categoria</h2>
			<p style="color: blue;">${msg}</p>
			<table class="table table-bordered border-primary">
				<tr class="table-success">
					<th class="table-success">NOME</th>
					<th class="table-success">ATIVO</th>
					<th class="table-success">A????ES</th>
				</tr>
				<c:forEach items="${listaCategoria}" var="categoria">

					<tr class="table-success">
						<td class="table-success">${categoria.nome}</td>
						<td class="table-success">${categoria.ativo}</td>
						<td class="table-success"><a
							href="${s:mvcUrl('CC#editarCategoria').arg(0, categoria.id).build() }"
							class="a"><img src="/resources/imgCSS/icone1.png"
								style="width: 25px;" /></a> <c:if test="${categoria.ativo == true}">
								<a
									href="${s:mvcUrl('CC#inativarCategoria').arg(0, categoria.id).build() }"
									class="a2"><img src="/resources/imgCSS/icone3.png"
									style="width: 25px;" /></a>
							</c:if> <c:if test="${categoria.ativo == false}">
								<a
									href="${s:mvcUrl('CC#ativarCategoria').arg(0, categoria.id).build() }"
									class="a2"><img src="/resources/imgCSS/icone2.png"
									style="width: 25px;" /></a>
							</c:if></td>

					</tr>


				</c:forEach>
			</table>
		</div>
	</div>

	<footer class="card text-bg-dark mb-3"
		style="max-width: 80rem; margin-top: 270px;">
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