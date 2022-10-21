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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<title> Categoria </title>
</head>
<body>
	<header>
		<nav class="navbar bg-dark navbar-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="#"> <img src="/resources/imgCSS/imgLogo.jpg"
					style="width: 50px;" />
				</a>

				<ul class="nav justify-content-center">
					<li class="nav-item"><a class="nav-link"
						href="/admin/categoria">Cadastro de Categorias</a></li>
				</ul>

			</div>
		</nav>
	</header>
	<div class="container">
		<div class="card">
			<h2>Categoria</h2>
			${msg}
			<table class="table table-bordered border-primary">
				<tr class="table-success">
					<th class="table-success">NOME</th>
					<th class="table-success">ATIVO</th>
					<th class="table-success">AÇÕES</th>
				</tr>
				<c:forEach items="${listaCategoria}" var="categoria">

					<tr class="table-success">
						<td class="table-success">${categoria.nome}</td>
						<td class="table-success">${categoria.ativo}</td>
						<td class="table-success"><a href="${s:mvcUrl('CC#editarCategoria').arg(0, categoria.id).build() }"
							class="a">Editar</a>
							
							<c:if test = "${categoria.ativo == true}">
								<a href="${s:mvcUrl('CC#inativarCategoria').arg(0, categoria.id).build() }" class="a2">Inativar</a>
							</c:if>
							
							<c:if test = "${categoria.ativo == false}">
								<a href="${s:mvcUrl('CC#ativarCategoria').arg(0, categoria.id).build() }" class="a2">ativar</a>
							</c:if>
							</td>

					</tr>


				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>