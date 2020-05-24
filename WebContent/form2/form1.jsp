<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

</head>
<body>
<%
String s1 = request.getParameter("s1");
int number1 = (s1 == null) ? 0 : Integer.parseInt(s1);
String plus = request.getParameter("++");
if(plus != null){number1++;}
%>
<form>
			<input type="text" name="s1" value="<%=number1%>" />
			 <button type="submit" name = "++">++</button>
			</form>
			
</body>
</html>
