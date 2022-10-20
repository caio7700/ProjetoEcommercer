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
<link rel="stylesheet" href="">
<title> Categoria </title>
</head>
<body>
	<header>
		<nav>
			<a class="menu" href="/formAutor">Cadastrar Categoria</a>
		</nav>
	</header>
	<div class="container">
		<div class="card">
			<h2>Categoria</h2>
			${msg}
			<table border="1">
				<tr>
					<th>NOME</th>
					<th>AÇÕES</th>
				</tr>
				<c:forEach items="${listaCategoria}" var="categoria">

					<tr>
						<td>${categoria.nome}</td>
						<td><a href="${s:mvcUrl('CC#editarCategoria').arg(0, categoria.id).build() }"
							class="a">Editar</a><a href="${s:mvcUrl('CC#excluirCategoria').arg(0, a.id).build() }"
							class="a2">Excluir</a></td>

					</tr>


				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>