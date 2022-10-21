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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<title>Document</title>
</head>
<body>
	<header>
		<nav>
			<ul class="nav-list">
				<li><a class="nav-link" href="/admin/editora">Cadastro de Editora</a></li>
				<li><a class="nav-link" href="/admin/listeditora">Lista de Editoras</a></li>
			</ul>
		</nav>
	</header>
	<div class="container" style="justify-content: center;">
		<div class="card">
			<h3 class="card-header">Atualize as Informções :</h3>
			<form:form action="${s:mvcUrl('EC#updateEditora').build()}" method="POST"
				modelAttribute="editora" enctype="multipart/form-data">
				<div class="card-body">
					<form:input type="hidden" path="id" value="${editoraEdit.id}" />
				</div>
				<div class="div1">
					<label class="col-sm-2 col-form-label"><b>Nome</b></label>
					<form:input class="form-control" path="nome" value="${editoraEdit.nome}" />
				</div>
				<div>
					<button type="submit" class="btn btn-outline-primary" style="--bs-btn-padding-y: .55rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .95rem;">Atualizar</button>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>