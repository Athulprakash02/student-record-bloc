part of 'search_bloc.dart';

abstract class SearchEvent {}

class OnSearch extends SearchEvent {
  final List<StudentModel> studentDetail;
  final String value;

  OnSearch({
    required this.studentDetail,
    required this.value,
  });
}
