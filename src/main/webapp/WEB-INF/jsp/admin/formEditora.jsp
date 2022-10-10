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
<title>Formulário Editora</title>
</head>
<body>
	<header>
		<nav>
			<a class="menu" href="/listapessoas">Lista de Editoras</a>
		</nav>
	</header>
	<div class="container">
		<div class="card">
			<h1>Formulário:</h1>
			<p>${msgm}</p>
			<form:form action="${s:mvcUrl('EC#create').build()}" method="POST"
				modelAttribute="editora" enctype="multipart/form-data">
				<div class="div1">
					<label><b>Nome</b></label>
					<form:input path="nome" />
					<form:errors path="nome" />
				</div>
				<button type="submit">CADASTRAR</button>
			</form:form>
		</div>
	</div>
</body>
</html>