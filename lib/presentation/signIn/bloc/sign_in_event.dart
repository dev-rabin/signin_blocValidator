abstract class SignInEvent {}

class SignInEditingEvent extends SignInEvent {
  final String emailValue;
  final String passwordValue;

  SignInEditingEvent({required this.emailValue, required this.passwordValue});
}

class SignInSubmitEvent extends SignInEvent {
  final String email;
  final String password;

  SignInSubmitEvent({required this.email, required this.password});
}
