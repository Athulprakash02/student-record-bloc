import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'edit_image_event.dart';
part 'edit_image_state.dart';

class EditImageBloc extends Bloc<EditImageEvent, EditImageState> {
  EditImageBloc() : super(EditImageInitial()) {
    on<OnImageChange>((event, emit) {
      // TODO: implement event handler
      return emit(EditImageState(event.imgPath));
    });
  }
}
