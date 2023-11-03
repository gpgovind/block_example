import 'package:block_example/bloc/submit_event.dart';
import 'package:block_example/bloc/submit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitBloc extends Bloc<SubmitEvent, SubmitState> {
  SubmitBloc() : super(SubmitInitialState()) {
    on<SubmitTextChangeEvent>((event, emit) {
      if (event.emailValue == '') {
        emit(SubmitErrorState('please valid EmailAddress'));
      } else if (event.passwordValue.length <= 7) {
        emit(SubmitErrorState('password minimum length needed 8'));
      }else {
        emit(SubmitValidState());
      }
    });
    on<SubmitButtonClickEvent>((event, emit) {
      emit(SubmitLoadingState());
    });
  }
}
