part of 'edit_image_bloc.dart';

@immutable
abstract class EditImageEvent {}

class OnImageChange extends EditImageEvent {
  final String imgPath;

  OnImageChange({required this.imgPath});
  
}
