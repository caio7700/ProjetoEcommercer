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
<title>Document</title>
</head>
<body>
	<div class="container">
		<div class="card">
			<h1>Atualize as Informções :</h1>
			<form:form action="${s:mvcUrl('CC#updateAutor').build()}" method="POST"
				modelAttribute="categoria" enctype="multipart/form-data">
				<div class="div1">
					<form:input type="hidden" path="id" value="${categoriaEdit.id}" />
				</div>
				<div class="div1">
					<label><b>Nome</b></label>
					<form:input path="nome" value="${categoriaEdit.nome}" />
				</div>
				<div>
					<button type="submit">Atualizar</button>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>