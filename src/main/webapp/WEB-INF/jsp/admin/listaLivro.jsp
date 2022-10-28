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
<title>Lista de Livros</title>
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
						<li class="nav-item"><a class="nav-link" href="/admin/autor">Cadastro
								de Autor</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/admin/listautor">Lista de Autores</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/admin/editora">Cadastro de Editora</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/admin/listeditora">Lista de Editora</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/admin/categoria">Cadastro de Categoria</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/admin/listacategoria">Lista de Categorias</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/admin/cadastrarlivro">Cadastro de Livro</a></li>
					</ul>
				</div>

			</div>
		</nav>
	</header>
<body>
	<div class="container">
		<div class="card">
			<h2>Tabela De Livros</h2>
			<p style="color: blue;">${msg}</p>
			<table class="table table-bordered border-primary">
				<tr class="table-success">
					<th class="table-success">Titulo</th>
					<th class="table-success">Nº PAG</th>
					<th class="table-success">Foto</th>
					<th class="table-success">Preço</th>
					<th class="table-success">Categoria</th>
					<th class="table-success">Editora</th>
					<th class="table-success">Autor</th>
					<th class="table-success">Ativo</th>
					<th class="table-success">Ações</th>
				</tr>
				<c:forEach items="${listaLivro}" var="livro">

					<tr class="table-success">
						<td class="table-success">${livro.titulo}</td>
						<td class="table-success">${livro.paginas}</td>
						<td class="table-success"><img src='/${livro.foto}'
							width="50px" height="50px" /></td>
						<td class="table-success">${livro.preco}</td>
						<td class="table-success">${livro.categoria.nome}</td>
						<td class="table-success">${livro.editora.nome}</td>
						<td class="table-success">${livro.autor.nome}</td>
						<td class="table-success">${livro.ativo}</td>
						<td class="table-success"><a
							href="${s:mvcUrl('LC#editarLivro').arg(0, livro.id).build() }"
							class="a"><img src="/resources/imgCSS/icone1.png"
								style="width: 25px;" /></a> <c:if test="${livro.ativo == true}">
								<a
									href="${s:mvcUrl('LC#inativarLivro').arg(0, livro.id).build() }"
									class="a2"><img src="/resources/imgCSS/icone3.png"
									style="width: 25px;" /></a>
							</c:if> <c:if test="${livro.ativo == false}">
								<a
									href="${s:mvcUrl('LC#ativarLivro').arg(0, livro.id).build() }"
									class="a2"><img src="/resources/imgCSS/icone2.png"
									style="width: 25px;" /></a>
							</c:if></td>
					</tr>


				</c:forEach>
			</table>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>