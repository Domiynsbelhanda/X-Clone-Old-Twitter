import 'package:flutter/material.dart';
import 'package:twitterclone/constants/ui_constants.dart';

class LoginView extends StatefulWidget{
  const LoginView ({super.key});

  @override
  State<LoginView> createState()=> _LoginViewState();
}

class _LoginViewState extends State<LoginView>{
  final appBar = UIConstants.appBar();

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: appBar,
    );
  }
}