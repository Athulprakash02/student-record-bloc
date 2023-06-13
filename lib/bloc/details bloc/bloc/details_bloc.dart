import 'package:bloc/bloc.dart';
import 'package:hive_db_sample/db/functions/db_functions.dart';
import 'package:meta/meta.dart';

import '../../../db/model/data_model.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitial(studentList: studentList)) {
    on<AddStudent>((event, emit) {
      studentList.add(event.list);
      return emit(DetailsState(studentList: studentList));
    });

    on<DeleteStudent>((event, emit) {
      studentList.removeAt(event.studentId);
      return emit(DetailsState(studentList: studentList));
    },);

    on<UpdateStudent>((event, emit) {
      studentList.removeAt(event.index);
      studentList.insert(event.index, event.value);
    });

    
  }
}
