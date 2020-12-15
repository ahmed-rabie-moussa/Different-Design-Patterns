import 'dart:math' as math;
import 'package:meta/meta.dart';
import 'package:different_design_patterns/template_method/student.dart';

//Template Method
//Template Class (Abstract Class) ==> the class that have the template algorithm.
abstract class StudentsBmiCalculator {
  //Algorithm steps
  List<Student> calculateBmiAndReturnStudentList() {
    List<Student> studentList = getStudentsData();
    studentList = doStudentsFiltering(studentList);
    _calculateStudentBmi(studentList);
    return studentList;
  }

  void _calculateStudentBmi(List<Student> studentList) {
    for (Student student in studentList) {
      student.bmi = _calculateBmi(student.height, student.weight);
    }
  }

  double _calculateBmi(double height, int weight) {
    return weight / math.pow(height, 2);
  }

  // Hook methods
  @protected
  List<Student> doStudentsFiltering(List<Student> studentList) {
    return studentList;
  }

  // Abstract methods
  @protected
  List<Student> getStudentsData();
}
