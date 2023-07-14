import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:twitterclone/common/common.dart';
import 'package:twitterclone/constants/constants.dart';
import 'package:twitterclone/features/auth/widgets/auth_field.dart';
import 'package:twitterclone/theme/theme.dart';

class SignUpView extends StatefulWidget{
  const SignUpView ({super.key});

  @override
  State<SignUpView> createState()=> _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView>{
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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [

                AuthField(
                  controller: emailController,
                  hintText: 'Email',
                ),

                const SizedBox(height: 24),

                AuthField(
                  controller: passwordController,
                  hintText: 'Password',
                ),

                const SizedBox(height: 40),

                Align(
                  alignment: Alignment.topRight,
                  child: RoundedSmallButton(
                      onTap: (){},
                      label: 'Done'
                  ),
                ),

                const SizedBox(height: 40),

                RichText(
                  text: TextSpan(
                    text: "Already have an account?",
                    style: const TextStyle(
                      fontSize: 16
                    ),
                    children: [
                      TextSpan(
                        text: ' Login',
                        style: const TextStyle(
                          color: Pallete.blueColor,
                          fontSize: 16
                        ),
                        recognizer: TapGestureRecognizer()..onTap = (){

                        }
                      )
                    ]
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}