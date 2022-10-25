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
<title>Lista de Autores</title>
</head>
<body>
	<header>
		<nav class="navbar bg-dark navbar-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="#"> <img
					src="/resources/imgCSS/imgLogo.jpg" style="width: 50px;" />
				</a>

				<ul class="nav justify-content-center">
					<li class="nav-item"><a class="nav-link" href="/admin/autor">Cadastro
							de Autor</a></li>

					<li class="nav-item"><a class="nav-link"
						href="/admin/listautor">Lista de Autores</a></li>

					<li class="nav-item"><a class="nav-link" href="/admin/editora">Cadastro
							de Editora</a></li>

					<li class="nav-item"><a class="nav-link"
						href="/admin/listeditora">Lista de Editora</a></li>

					<li class="nav-item"><a class="nav-link"
						href="/admin/categoria">cadastro de Categoria</a></li>

					<li class="nav-item"><a class="nav-link"
						href="/admin/listalivro">Lista de Livro</a></li>

					<li class="nav-item"><a class="nav-link"
						href="/admin/listalivro">Lista de Livros</a></li>
				</ul>

			</div>
		</nav>
	</header>
<body>
</body>
</html>