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
			<a class="menu" href="/admin/editora">Cadastrar Editora</a>
		</nav>
	</header>
	<div class="container">
		<div class="card">
			<h2>Tabela De Editora</h2>
			${msg}
			<table border="1">
				<tr>
					<th>NOME</th>
					<th>ATIVO</th>
					<th>AÇÕES</th>
				</tr>
				<c:forEach items="${listEditoras}" var="editora">

					<tr>
						<td>${editora.nome}</td>
						<td>${editora.ativo}</td>
						<td><a href="${s:mvcUrl('EC#editarEditora').arg(0, editora.id).build() }"
							class="a">Editar</a> 
							<c:if test = "${editora.ativo == true}">
								<a href="${s:mvcUrl('EC#inativarEditora').arg(0, editora.id).build() }" class="a2">Inativar</a>
							</c:if>
							<c:if test = "${editora.ativo == false}">
								<a href="${s:mvcUrl('EC#ativarEditora').arg(0, editora.id).build() }" class="a2">ativar</a>
							</c:if>
							</td>

					</tr>


				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>