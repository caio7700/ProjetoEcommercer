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
<title>Lista de Editoras</title>
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
						href="/admin/editora">Cadastro de Editoras</a></li>
				</ul>

			</div>
		</nav>
	</header>
	<div class="container">
		<div class="card">
			<h2>Tabela De Editora</h2>
			${msg}
			<table class="table table-bordered border-primary">
				<tr class="table-success">
					<th class="table-success">NOME</th>
					<th class="table-success">ATIVO</th>
					<th class="table-success">AÇÕES</th>
				</tr>
				<c:forEach items="${listEditoras}" var="editora">

					<tr class="table-success">
						<td class="table-success">${editora.nome}</td>
						<td class="table-success">${editora.ativo}</td>
						<td class="table-success"><a
							href="${s:mvcUrl('EC#editarEditora').arg(0, editora.id).build() }"
							class="a"><img src="/resources/imgCSS/icone1.png"
					style="width: 25px;" /></a> 
							
							<c:if test="${editora.ativo == true}">
								<a
									href="${s:mvcUrl('EC#inativarEditora').arg(0, editora.id).build() }"
									class="a2"><img src="/resources/imgCSS/icone3.png"
					style="width: 25px;" /></a>
							</c:if> <c:if test="${editora.ativo == false}">
								<a
									href="${s:mvcUrl('EC#ativarEditora').arg(0, editora.id).build() }"
									class="a2"><img src="/resources/imgCSS/icone2.png"
					style="width: 25px;" /></a>
							</c:if></td>

					</tr>


				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>