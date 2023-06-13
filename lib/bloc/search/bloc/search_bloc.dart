import 'package:bloc/bloc.dart';
import 'package:hive_db_sample/db/functions/db_functions.dart';
import 'package:meta/meta.dart';

import '../../../db/model/data_model.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial(searchList: studentList)) {
    on<OnSearch>((event, emit) {
      // TODO: implement event handler
      emit(SearchState(
          searchList: event.studentDetail
              .where((element) => element.name
                  .toLowerCase()
                  .contains(event.value.toLowerCase()))
              .toList()));
    });
  }
}
