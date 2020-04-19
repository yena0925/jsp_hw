<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<style type="text/css">

table {

	border-collapse: collapse;

	font-size: 20px;

	padding: 2px;

	text-align: center;

}



tr {

	border: 2px solid gray;

	width: 120px;

	height: 35px;

}



td {

	border: 2px solid gray;

	width: 120px;

	height: 35px

}

</style>

<meta charset="UTF-8">

<title>Insert title here</title>

</head>

<body>

	<table>

			<%out.print("<tr>");

				for (int i = 2; i < 10; i++) {

					if(i == 6) out.print("</tr><tr>");

					out.print("<td>");

					for (int j = 1; j < 10; j++) {

						out.print(i + " x " + j + " = " + i * j + "<br>");

					}

					out.print("</td>");

				}

				out.print("</tr>");

			%>



	</table>

</body>

</html>