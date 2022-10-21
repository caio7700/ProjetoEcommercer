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
			<a class="nav-link" href="/admin/listacategoria">Lista de Editoras</a>
		</nav>
	</header>
	<div class="container">
		<div class="card">
			<h3 class="card-header">Formulário:</h3>
			<p>${msgm}</p>
			<form:form action="${s:mvcUrl('CC#create').build()}" method="POST"
				modelAttribute="categoria" enctype="multipart/form-data">
				<div class="card-body">
					<label class="col-sm-2 col-form-label"><b>Nome</b></label>
					<form:input path="nome" class="form-control" />
					<form:errors path="nome" />
				</div>
				<button type="submit" class="btn btn-outline-primary" style="--bs-btn-padding-y: .55rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .95rem;">CADASTRAR</button>
			</form:form>
		</div>
	</div>
</body>
</html>