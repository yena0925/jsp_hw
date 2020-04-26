
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
	table {border-collapse: collapse; text-align: center;	}
	tr {border: 1px solid gray;	width: 120px;	height: 35px;}
	td {border: 1px solid gray;	width: 120px;	height: 35px;}
</style>
<title>gugu1</title>
</head>
<body>
	<table>
		<%
		for(int i = 1; i <= 9; i++){
			out.print("<tr>");
			for(int j = 2; j <= 9; j++){
				out.print("<td>"+j+" x "+i+" = "+i*j +"</td>");
			}
			out.print("</tr>");
		}
		%>
	</table>
</body>
</html>