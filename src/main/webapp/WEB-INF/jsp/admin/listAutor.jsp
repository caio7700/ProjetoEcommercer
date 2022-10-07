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
<title>Lista de Autores</title>
</head>
<body>
	<header>
		<nav>
			<a class="menu" href="/formAutor">Cadastrar Autores</a>
		</nav>
	</header>
	<div class="container">
		<div class="card">
			<h2>Tabela De Autores</h2>
			${msg}
			<table border="1">
				<tr>
					<th>NOME</th>
					<th>AÇÕES</th>
				</tr>
				<c:forEach items="${listAutores}" var="a">

					<tr>
						<td>${a.nome}</td>
						<td><a href="${s:mvcUrl('AC#editarAutor').arg(0, a.id).build() }"
							class="a">Editar</a><a href="${s:mvcUrl('AC#excluirAutor').arg(0, a.id).build() }"
							class="a2">Excluir</a></td>

					</tr>


				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>