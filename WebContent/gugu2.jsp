<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>gugu2</title>

<style>
table {
	border-collapse: collapse;
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
	text-align: center;
}

td {
	border-left: 1px solid gray;
	border-right: 1px solid gray;
	width: 120px;
	height: 35px;
}
</style>

</head>

<body>

	<table>

		<%
			for (int i = 0; i < 9; i++) {

			out.print("<tr>");

			for (int j = 0; j < 8; j++) {

				String text = (j + 2) + " x " + (i + 1) + "=" + Integer.toString((i + 1) * (j + 2));

				out.print("<td>" + text + "</td>");

			}

			out.print("</tr>");

		}
		%>

	</table>

</body>

</html>