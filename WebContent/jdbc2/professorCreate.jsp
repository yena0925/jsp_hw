<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, lecture1.jdbc2.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="professor" class="lecture1.jdbc2.Professor" />
<jsp:setProperty property="*" name="professor" />
<%
	String errorMessage = null;
if (request.getMethod().equals("POST")) {
	errorMessage = ProfessorService.insert(professor);
	if (errorMessage == null) {
		response.sendRedirect("professorList1.jsp");
		return;
	}
}
List<Department> departments = DepartmentDAO.findAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="/jsp_hw/res/common.css">
<script src="https://kit.fontawesome.com/68abb170e0.js"
	crossorigin="anonymous"></script>
<style>
form {
	padding: 10px 40px 40px 40px;
	width: 400px;
}

label {
	display: inline-block;
	width: 40px;
	text-align: right;
	margin-right: 4px;
}

form div {
	margin-top: 20px;
}

input[name=year] {
	width: 60px;
}
</style>
</head>
<body>
	<div class="container">
		<form method="post" class="shadow">
			<h1>교수 등록</h1>
			<div>
				<label>교번</label> <input type="text" name="id"
					value="${ professor.id }" />
			</div>
			<div>
				<label>이름</label> <input type="text" name="professorName"
					value="${ professor.professorName }" />
			</div>
			<div>
				<label>학과</label> <select name="departmentId">
					<%
						for (Department department : departments) {
					%>
					<%
						int id = department.getId();
					%>
					<%
						String dname = department.getDepartmentName();
					%>
					<option value="<%=id%>"
						<%=id == professor.getDepartmentId() ? "selected" : ""%>>
						<%=dname%>
					</option>
					<%
						}
					%>
				</select>
			</div>
			<div>
				<button type="submit" class="btn">
					<i class="fas fa-check"></i> 저장
				</button>
				<a class="btn" href="professorList1.jsp"><i class="fas fa-ban"></i>취소</a>
			</div>
			<%
				if (errorMessage != null) {
			%>
			<div class="error">
				저장 실패:
				<%=errorMessage%></div>
			<%
				}
			%>
		</form>
	</div>
</body>
</html>