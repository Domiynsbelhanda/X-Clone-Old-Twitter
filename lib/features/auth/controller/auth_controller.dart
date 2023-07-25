import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitterclone/apis/auth_api.dart';
import 'package:twitterclone/core/utils.dart';
import 'package:twitterclone/features/auth/view/login_view.dart';
import 'package:twitterclone/features/home/view/home_view.dart';
import 'package:appwrite/models.dart' as model;

final authControllerProvier = StateNotifierProvider<AuthController, bool>((ref){
  return AuthController(authAPI: ref.watch(authAPIProvider));
});

final currentUserAccountProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvier.notifier);
  return authController.currentUser();
});

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authAPI;

  AuthController({required AuthAPI authAPI})
      : _authAPI = authAPI,
        super(false);

  Future<model.Account?> currentUser() => _authAPI.currentUserAccount();

  void signUp(
      {required String email,
      required String password,
      required BuildContext context}) async {
    state = true;
    final res = await _authAPI.signUp(email: email, password: password);
    state = false;
    res.fold(
            (l) => showSnackBar(context, l.message),
            (r){
              showSnackBar(context, 'Accounted created ! Please login.');
              Navigator.push(context, LoginView.route());
            }
    );
  }

  void login(
      {required String email,
        required String password,
        required BuildContext context}) async {
    state = true;
    final res = await _authAPI.login(email: email, password: password);
    state = false;
    res.fold(
            (l) => showSnackBar(context, l.message),
            (r){
              showSnackBar(context, "You're login, welcome to Twitter Clone");
              Navigator.push(context, HomeView.route());
            }
    );
  }
}
