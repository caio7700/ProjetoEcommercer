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
<title>BooKFliX</title>

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

.navbar-brand mb-0 h1	 hover {
	color: rgb(37, 37, 104);
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
					<div class="input-group mb-3">
						<button class="btn btn-outline-secondary" type="button">
							<a href="#"><img src="/resources/imgCSS/carro.png"
								style="width: 25px;" /></a>
						</button>

						<form:input path="titulo" class="form-control"
							placeholder="Search" style="width: 350px;" />

						<button class="btn btn-outline-secondary" type="submit">
							<img src="/resources/imgCSS/icone4.png" style="width: 25px;" />
						</button>
					</div>

				</form:form>
			</div>

			<a href="/" class="link-logo" style="color: white;"><span
				class="navbar-brand mb-0 h1">BOOKFLIX</span></a>
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
							<a
								href="${s:mvcUrl('HC#buscaPorAutor').arg(0, autor.id).build() }">
								<li class="list-group-item">${autor.nome}</li>
							</a>
						</c:forEach>
					</ul>
					<span><b>Categorias</b></span>
					<ul class="list-group list-group-flush">
						<c:forEach items="${categorias}" var="categoria">
							<a
								href="${s:mvcUrl('HC#buscaPorCategoria').arg(0, categoria.id).build() }">
								<li class="list-group-item">${categoria.nome}</li>
							</a>
						</c:forEach>
					</ul>
					<span><b>Editoras</b></span>
					<ul class="list-group list-group-flush">
						<c:forEach items="${editoras}" var="editora">
							<a
								href="${s:mvcUrl('HC#buscaPorEditora').arg(0, editora.id).build() }">
								<li class="list-group-item">${editora.nome}</li>
							</a>
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
			<h4 style="color: dark; padding-bottom: 20px;">${msg}</h4>
			<hr>
			<ul class="list-group mb-3">
				<li class="list-group-item py-3">
					<div class="row g-3">
						<div class="col-4 col-md-3 col-lg-2">
							<img src="/${livro.foto}" class="card-img-top">
						</div>
						<div
							class="col-8 col-md-9 col-lg-7 col-xl-8 text-left align-self-center">
							<h4>
								<b><h5 class="card-title">${livro.titulo}</h5></b>
							</h4>
						</div>
						<div
							class="col-6 offset-6 col-sm-6 offset-sm-6 col-md-4 offset-md-8 col-lg-3 offset-lg0 col-xl-2 align-self-center mt-3">
							<div class="input-group">
								<button type="button" class="btn btn-outline-dark btn-sm">
									<img src="/resources/imgCSS/setaDown.png" />
								</button>
								<input type="text" class="form-control text -center border-dark"/>
								<button type="button" class="btn btn-outline-dark btn-sm">
									<img src="/resources/imgCSS/setaTop.png" />
								</button>
								<button type="button" class="btn btn-outline-danger border-dark btn-sm">
									<img src="/resources/imgCSS/trash.png" />
								</button>
							</div>
							<div class="text-right mt-2">
							<h5>R$ ${livro.preco}</h5>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</main>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>