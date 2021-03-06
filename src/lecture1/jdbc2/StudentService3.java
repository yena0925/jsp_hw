package lecture1.jdbc2;

import lecture1.utils.StringUtil;

public class StudentService3 {
	static String validate(Student student) {
		if (StringUtil.isEmptyOrBlank(student.getStudentNumber()))
			return "학번을 입력하세요";
		if (StringUtil.isEmptyOrBlank(student.getName()))
			return "이름을 입력하세요";
		if (student.getYear() == 0)
			return "학년을 입력하세요";
		return null;
	}

	public static String validateBeforeInsert(Student student) throws Exception {
		String errorMessage = validate(student);
		if (errorMessage != null)
			return errorMessage;
		if (StudentDAO.findByStudentNumber(student.getStudentNumber()) != null)
			return "학번이 중복됩니다.";
		return null;
	}

	public static String insert(Student student) throws Exception {
		String errorMessage = validateBeforeInsert(student);
		if (errorMessage != null)
			return errorMessage;
		StudentDAO.insert(student);
		return null;
	}

	public static String validateBeforeUpdate(Student student) throws Exception {
		String errorMessage = validate(student);
		if (errorMessage != null)
			return errorMessage;
		Student student1 = StudentDAO.findByStudentNumber(student.getStudentNumber());
		if (student1 != null && student1.getId() != student.getId())
			return "학번이 중복됩니다.";
		return null;
	}

	public static String update(Student student) throws Exception {
		String errorMessage = validateBeforeUpdate(student);
		if (errorMessage != null)
			return errorMessage;
		StudentDAO.update(student);
		return null;
	}
}