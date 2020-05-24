<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="lecture1.jdbc2.*"%>
<%
	String 에러메시지 = null;
Student student = new Student();
request.setCharacterEncoding("UTF-8");
if (request.getMethod().equals("POST")) {
	student.setStudentNumber(request.getParameter("studentNumber"));
	student.setName(request.getParameter("name"));
	String s = request.getParameter("departmentId");
	student.setDepartmentId(Integer.parseInt(s));
	s = request.getParameter("year");
	student.setYear(Integer.parseInt(s));
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
<script src="https://kit.fontawesome.com/68abb170e0.js"
	crossorigin="anonymous"></script>
<style>
div.container {
	width: 700px;
	margin: 20px auto;
	font-size: 11pt;
}

form {
	padding: 10px 40px 40px 40px;
	width: 400px;
	box-shadow: 0px 0px 4px rgba(0, 0, 0, 0.4), 2px 2px 4px
		rgba(0, 0, 0, 0.4);
}

form div {
	margin-top: 20px;
}

label {
	display: inline-block;
	width: 40px;
	text-align: right;
	margin-right: 4px;
}

input[type=text], select {
	padding: 5px;
}

input[name=year] {
	width: 60px;
}

.btn {
	padding: 0.7em 1.5em;
	border: 1px solid #aaa;
	border-radius: 4px;
	background: linear-gradient(#fff, #ddd);
	color: black;
	font-family: 굴림체;
	font-size: 10pt;
	line-height: 1em;
	text-decoration: none;
	cursor: pointer;
	display: inline-block;
}

.btn:active {
	-ms-transform: translateY(2px);
	-webkit-transform: translateY(2px);
	transform: translateY(2px);
	ba ckground: #ccc;
}

div.info {
	margin-top: 20px;
	padding: 10px 20px;
	background-color: #dff;
	border: 1px solid #8ff;
}

div.error {
	margin-top: 20px;
	padding: 10px 20px;
	background-color: #fdd;
	border: 1px solid #faa;
}
</style>
</head>
<body>
	<div class="container">
		<form method="post">
			<h1>학생 등록</h1>
			<div>
				<label>학번</label> <input type="text" name="studentNumber"
					value="<%=student.getStudentNumber()%>" />
			</div>
			<div>
				<label>이름</label> <input type="text" name="name"
					value="<%=student.getName()%>" />
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
					value="<%=student.getYear()%>" />
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