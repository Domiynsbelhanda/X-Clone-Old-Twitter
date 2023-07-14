import 'package:flutter/material.dart';
import 'package:twitterclone/constants/ui_constants.dart';
import 'package:twitterclone/features/auth/widgets/auth_field.dart';

class LoginView extends StatefulWidget{
  const LoginView ({super.key});

  @override
  State<LoginView> createState()=> _LoginViewState();
}

class _LoginViewState extends State<LoginView>{
  final appBar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              
              AuthField(
                controller: emailController,
                hintText: 'Email',
              ),
              
              AuthField(
                controller: passwordController,
                hintText: 'Password',
              )
            ],
          ),
        ),
      ),
    );
  }
}