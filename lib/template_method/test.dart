import 'package:different_design_patterns/template_method/students_json_bmi_calculator.dart';

class Test {
  void testTemplatePattern() {
    print("For all students:");
    StudentsJsonBmiCalculator()
        .calculateBmiAndReturnStudentList()
        .forEach((student) {
      print("Name: ${student.fullName}, BMI: ${student.bmi}");
    });
    print("For teenage (Only):");
    TeenageStudentsJsonBmiCalculator()
        .calculateBmiAndReturnStudentList()
        .forEach((student) {
      print("Name: ${student.fullName}, BMI: ${student.bmi}");
    });
  }
}
