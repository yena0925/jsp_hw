<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
</head>
<body>
	<%
		String num = request.getParameter("num");
	if (num == null) {
		num = "one";
	}
	%>
	<div>
		<form action="form2.jsp" method="get">
			<select name="num">
				<option value="one" <%="one".equals(num) ? "selected" : ""%>>one</option>
				<option value="two" <%="two".equals(num) ? "selected" : ""%>>two</option>
				<option value="three" <%="three".equals(num) ? "selected" : ""%>>three</option>
			</select>
			<div>

				<input type="text" name="param" value="<%=num%>" />

			</div>
			<div>
				<button type="submit" name="Ok">Ok</button>
			</div>

		</form>
	</div>
</body>
</html>