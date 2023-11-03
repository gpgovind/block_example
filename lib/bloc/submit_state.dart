abstract class SubmitState {}

class SubmitInitialState extends SubmitState {}

class SubmitValidState extends SubmitState {}

class SubmitLoadingState extends SubmitState {}

class SubmitErrorState extends SubmitState {
  final String error;
  SubmitErrorState(this.error);
}
