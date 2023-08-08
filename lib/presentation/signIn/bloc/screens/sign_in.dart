// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signin_bloc/presentation/signIn/bloc/sign_in_bloc.dart';
import 'package:signin_bloc/presentation/signIn/bloc/sign_in_event.dart';
import 'package:signin_bloc/presentation/signIn/bloc/sign_in_state.dart';

class SignInScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signin"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInErrorState) {
                  return Text(
                    state.errorMessage,
                    style: TextStyle(color: Colors.red),
                  );
                } else {
                  return Container();
                }
              },
            ),
            TextField(
              controller: emailController,
              onChanged: (value) {
                BlocProvider.of<SignInBloc>(context).add(SignInEditingEvent(
                    emailValue: emailController.text.trim(),
                    passwordValue: passwordController.text.trim()));
              },
              decoration: InputDecoration(hintText: "Email"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: passwordController,
              onChanged: (value) {
                BlocProvider.of<SignInBloc>(context).add(SignInEditingEvent(
                    emailValue: emailController.text.trim(),
                    passwordValue: passwordController.text.trim()));
              },
              decoration: InputDecoration(hintText: "Password"),
              obscureText: true,
            ),
            SizedBox(
              height: 10,
            ),
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return CupertinoButton(
                  onPressed: () {
                    if (state is SignInValidState) {
                      BlocProvider.of<SignInBloc>(context).add(
                        SignInSubmitEvent(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        ),
                      );
                    }
                  },
                  color:
                      (state is SignInValidState) ? Colors.blue : Colors.grey,
                  child: Text("Signin"),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
