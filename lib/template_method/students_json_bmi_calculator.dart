import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:different_design_patterns/template_method/json_students_api.dart';
import 'package:different_design_patterns/template_method/student.dart';
import 'package:different_design_patterns/template_method/template_students_bmi_calculator.dart';

//Algorithm to All students without implementing filter method (optional)
class StudentsJsonBmiCalculator extends StudentsBmiCalculator {
  // Mocking fetching data from network or something like that.
  final JsonStudentsApi _api = JsonStudentsApi();

  //this operation must overrides at any subclass as it is not defined default.
  @override
  @protected
  List<Student> getStudentsData() {
    String studentsJson = _api.getStudentsJson();
    var studentsMap = json.decode(studentsJson) as Map<String, dynamic>;
    var studentsJsonList = studentsMap['students'] as List;
    var studentsList = studentsJsonList
        .map((json) => Student(
              fullName: json['fullName'],
              age: json['age'],
              height: json['height'],
              weight: json['weight'],
            ))
        .toList();

    return studentsList;
  }
}

//Algorithm with implementing filter method to specific teenage students
class TeenageStudentsJsonBmiCalculator extends StudentsBmiCalculator {
  // Mocking fetching data from network or something like that.
  final JsonStudentsApi _api = JsonStudentsApi();

  @override
  @protected
  List<Student> getStudentsData() {
    String studentsJson = _api.getStudentsJson();
    var studentsMap = json.decode(studentsJson) as Map<String, dynamic>;
    var studentsJsonList = studentsMap['students'] as List;
    var studentsList = studentsJsonList
        .map((json) => Student(
              fullName: json['fullName'],
              age: json['age'],
              height: json['height'],
              weight: json['weight'],
            ))
        .toList();

    return studentsList;
  }

  //Overriding this optional overrided method from the parent as it has a default code steps.
  @override
  @protected
  List<Student> doStudentsFiltering(List<Student> studentList) {
    return studentList
        .where((student) => student.age > 12 && student.age < 20)
        .toList();
  }
}
