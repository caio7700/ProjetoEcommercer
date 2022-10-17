<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Import da taglib -->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/editarPessoa.css">
<title>Document</title>
</head>
<body>
	<header>
		<nav>
			<ul class="nav-list">
				<li><a class="menu" href="/pessoa">Cadastro de Autores</a></li>
				<li><a class="menu" href="/listapessoas">Lista de Autores</a></li>
			</ul>
		</nav>
	</header>
	<div class="container">
		<div class="card">
			<h1>Atualize as Informções :</h1>
			<form:form action="${s:mvcUrl('AC#updateAutor').build()}" method="POST"
				modelAttribute="autor" enctype="multipart/form-data">
				<div class="div1">
					<form:input type="hidden" path="id" value="${autorEdit.id}" />
				</div>
				<div class="div1">
					<label><b>Nome</b></label>
					<form:input path="nome" value="${autorEdit.nome}" />
				</div>
				<div>
					<button type="submit">Atualizar</button>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>