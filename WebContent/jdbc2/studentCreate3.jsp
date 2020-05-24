<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="lecture1.jdbc2.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="student" class="lecture1.jdbc2.Student" />
<jsp:setProperty property="*" name="student" />
<%
	String 에러메시지 = null;
if (request.getMethod().equals("POST")) {
	if (student.getStudentNumber() == null || student.getStudentNumber().length() == 0)
		에러메시지 = "학번을 입력하세요";
	else if (student.getName() == null || student.getName().length() == 0)
		에러메시지 = "이름을 입력하세요";
	else if (student.getYear() == 0)
		에러메시지 = "학년을 입력하세요";
	else {
		session.setAttribute("student", student);
		response.sendRedirect("studentCreate_success.jsp");
		return;
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="/lecture1/res/common.css">
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
			<h1>학생 등록</h1>
			<div>
				<label>학번</label> <input type="text" name="studentNumber"
					value="${ student.studentNumber }" />
			</div>
			<div>
				<label>이름</label> <input type="text" name="name"
					value="${ student.name }" />
			</div>
			<div>
				<label>학과</label> <select name="departmentId">
					<option value="1"
						<%=student.getDepartmentId() == 1 ? "selected" : ""%>>소프트웨어공학과</option>
					<option value="2"
						<%=student.getDepartmentId() == 2 ? "selected" : ""%>>컴퓨터공학과</option>
					<option value="3"
						<%=student.getDepartmentId() == 3 ? "selected" : ""%>>정보통신공학과</option>
					<option value="4"
						<%=student.getDepartmentId() == 4 ? "selected" : ""%>>글로컬IT공학과</option>
				</select>
			</div>
			<div>
				<label>학년</label> <input type="text" name="year"
					value="${ student.year }" />
			</div>
			<div>
				<button type="submit" class="btn">
					<i class="fas fa-check"></i> 저장
				</button>
				<a class="btn" href="studentList1.jsp"><i class="fas fa-ban"></i>
					취소</a>
			</div>
			<% if (에러메시지 != null) { %>
			<div class="error">
				저장 실패:
				<%= 에러메시지 %></div>
			<% } %>
		</form>
	</div>
</body>
</html>