import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_db_sample/bloc/details%20bloc/bloc/details_bloc.dart';
import 'package:hive_db_sample/db/model/data_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

List<StudentModel> studentList = [];

addStudent(StudentModel value, BuildContext context) {
  final studentDB = Hive.box<StudentModel>('student_db');

  BlocProvider.of<DetailsBloc>(context).add(AddStudent(list: value));
  studentDB.add(value);
  getAllStudents();

}

getAllStudents() {
  final studentDB = Hive.box<StudentModel>('student_db');
  
  studentList.clear();
  studentList.addAll(studentDB.values);

}

deleteStudent(int id, BuildContext context) async{
  final studentDb =await Hive.box<StudentModel>('student_db');
  BlocProvider.of<DetailsBloc>(context).add(DeleteStudent(studentId: id));
 await studentDb.deleteAt(id);
  getAllStudents();
}
