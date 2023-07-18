import 'package:flutter/material.dart';

class Loader extends StatelessWidget{
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class LoadingPage extends StatelessWidget{
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Scaffold(
      body: Loader(),
    );
  }
}