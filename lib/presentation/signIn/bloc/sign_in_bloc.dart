import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signin_bloc/presentation/signIn/bloc/sign_in_event.dart';
import 'package:signin_bloc/presentation/signIn/bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInEditingEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(SignInErrorState("Please enter valid email address"));
      } else if (event.passwordValue.length < 8) {
        emit(SignInErrorState("Please enter valid password"));
      } else {
        emit(SignInValidState());
      }
    });

    on<SignInSubmitEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
