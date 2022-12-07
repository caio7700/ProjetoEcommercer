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
<title>Pagamento</title>

<style>
.modal {
	width: 300px;
}

.modal-content {
	width: 300px;
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
			<h4 style="color: dark; padding-top: 20px; padding-bottom: 20px;">Livros
				Comprados do pedido : ${numeroPedido}</h4>
			<hr>
			<ul class="list-group mb-3">
				<c:forEach items="${livrosPagos}" var="livro">
					<li class="list-group-item py-3">

						<div class="row g-3">
							<div class="col-4 col-md-3 col-lg-2">
								<img src="/${livro.foto}" class="card-img-top">
							</div>
							<div
								class="col-8 col-md-9 col-lg-7 col-xl-8 text-left align-self-center">
								<h4>

									<b>${livro.titulo}</b>

								</h4>
							</div>
							<div
								class="col-6 offset-6 col-sm-6 offset-sm-6 col-md-4 offset-md-8 col-lg-3 offset-lg-0 col-xl-2 align-self-center mt-3"
								style="width: 800px;">

								<div class="text-right mt-2">
									<h5>R$ ${livro.preco}</h5>
								</div>
							</div>

						</div>
					</li>
				</c:forEach>

			</ul>
		</div>
	</main>

	<footer class="card text-bg-dark mb-3"
		style="max-width: 80rem; margin-top: 110px;">
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