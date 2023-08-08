// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signin_bloc/presentation/signIn/bloc/screens/sign_in.dart';
import 'package:signin_bloc/presentation/signIn/bloc/sign_in_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(left: 75),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome! Choose Authentication"),
            SizedBox(
              height: 10,
            ),
            CupertinoButton(
                color: Colors.blue,
                child: Text("Signin"),
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) {
                      return BlocProvider(
                          create: (context) => SignInBloc(),
                          child: SignInScreen());
                    }),
                  );
                })
          ],
        ),
      ),
    );
  }
}
