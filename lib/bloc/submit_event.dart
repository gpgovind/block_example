abstract class SubmitEvent {}

class SubmitTextChangeEvent extends SubmitEvent {
  final String emailValue;
  final String passwordValue;

  SubmitTextChangeEvent(this.emailValue, this.passwordValue);
}

class SubmitButtonClickEvent extends SubmitEvent {
  final String email;
  final String password;
  SubmitButtonClickEvent(this.email, this.password);
}
