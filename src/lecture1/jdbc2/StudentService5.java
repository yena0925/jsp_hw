package lecture1.jdbc2;

import lecture1.utils.StringUtil;

public class StudentService5 {
	static final String 학번_필수 = "학번을 입력하세요";
	static final String 이름_필수 = "이름을 입력하세요";
	static final String 학년_필수 = "학년을 입력하세요";
	static final String 학번_중복 = "학번이 중복됩니다";

	public static String validate(Student student) throws Exception {
		if (StringUtil.isEmptyOrBlank(student.getStudentNumber()))
			return 학번_필수;
		if (StringUtil.isEmptyOrBlank(student.getName()))
			return 이름_필수;
		if (student.getYear() == 0)
			return 학년_필수;
		Student student1 = StudentDAO.findByStudentNumber(student.getStudentNumber());
		if (student1 != null && student1.getId() != student.getId())
			return 학번_중복;
		return null;
	}

	public static String insert(Student student) throws Exception {
		String errorMessage = validate(student);
		if (errorMessage != null)
			return errorMessage;
		StudentDAO.insert(student);
		return null;
	}

	public static String update(Student student) throws Exception {
		String errorMessage = validate(student);
		if (errorMessage != null)
			return errorMessage;
		StudentDAO.update(student);
		return null;
	}
}