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
<title>Lista de Editoras</title>
</head>
<body>
	<header>
		<nav>
			<a class="menu" href="/formEditora">Cadastrar Editora</a>
		</nav>
	</header>
	<div class="container">
		<div class="card">
			<h2>Tabela De Editora</h2>
			${msg}
			<table border="1">
				<tr>
					<th>NOME</th>
					<th>AÇÕES</th>
				</tr>
				<c:forEach items="${listEditora}" var="e">

					<tr>
						<td>${e.nome}</td>
					<!-- 	<a href="${s:mvcUrl('EC#editarEditora').arg(0, e.id).build() }"
							class="a">Editar</a><td><a href="${s:mvcUrl('EC#excluirEditora').arg(0, e.id).build() }"
							class="a2">Excluir</a> </td> -->

					</tr>


				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>