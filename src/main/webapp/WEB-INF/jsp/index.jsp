<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Import da taglib -->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="Pt-Br">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<title>Document</title>

<style>
.modal {
	width: 300px;
}

.modal-content {
	width: 300px;
}

.list-group-item:hover {
	cursor: pointer;
	background-color: rgb(37, 37, 104);
	color: white;
	transition: 0.5s;
}

.modal-header {
	background-color: rgb(37, 37, 104);
	color: white;
}

.btn-close {
	color: white;
}

.input-group {
	width: 450px;
}
</style>
</head>
<body>

	<nav class="navbar bg-dark navbar-dark shadow">
		<div class="container-fluid">
			<button class="navbar-toggler" type="button" data-bs-toggle="modal"
				data-bs-target="#exampleModal">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="input-group">
				<form:form action="${s:mvcUrl('HC#buscaTitulo').build()}"
					method="POST" modelAttribute="livro">
					<form:input path="titulo" class="form-control" placeholder="Search"
						style="width: 450px;" />

					<button class="btn btn-outline-secondary" type="submit">Search</button>

				</form:form>
			</div>


			<span class="navbar-brand mb-0 h1">BOOKFLIX</span>
		</div>
	</nav>

	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-fullscreen">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Filtros</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<span><b>Autores</b></span>
					<ul class="list-group list-group-flush">
						<c:forEach items="${autores}" var="autor">
							<a href="${s:mvcUrl('HC#buscaPorAutor').arg(0, autor.id).build() }">
							<li class="list-group-item">${autor.nome}</li></a>
						</c:forEach>
					</ul>
					<span>Categorias</span>
					<ul class="list-group list-group-flush">
						<c:forEach items="${categorias}" var="categoria">
							<a href="${s:mvcUrl('HC#buscaPorCategoria').arg(0, categoria.id).build() }">
							<li class="list-group-item">${categoria.nome}</li></a>
						</c:forEach>
					</ul>
					<span>Editoras</span>
					<ul class="list-group list-group-flush">
						<c:forEach items="${editoras}" var="editora">
							<a href="${s:mvcUrl('HC#buscaPorEditora').arg(0, editora.id).build() }">
							<li	class="list-group-item">${editora.nome}</li></a>
						</c:forEach>
					</ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Fechar</button>
				</div>
			</div>
		</div>
	</div>

	<main>

		<div class="container">
			<div class="row">
				<c:forEach items="${livros}" var="livro">
					<div
						class="col-xl-2 col-lg-3 col-md-4 col-sm-6 d-flex align-items-stretch">
						<div class="card text-center bg-light">
							<img src="/${livro.foto}" class="card-img-top">
							<div class="card-header">${livro.preco}</div>
							<div class="card-body">
								<h5 class="card-title">${livro.titulo}</h5>
							</div>
							<div class="card-footer">
								<form class="d-block">
									<button class="btn btn-danger">adicionar ao carrinho</button>
								</form>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

		</div>
	</main>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>