part of 'details_bloc.dart';

@immutable
abstract class DetailsEvent {}

class AddStudent extends DetailsEvent {
  final StudentModel list;

  AddStudent({required this.list});
}


class DeleteStudent extends DetailsEvent{
  final int studentId;

  DeleteStudent({required this.studentId});
  
}

class UpdateStudent extends DetailsEvent {
  final int index;
  final StudentModel value;

  UpdateStudent({required this.index,required this.value});
  
}

