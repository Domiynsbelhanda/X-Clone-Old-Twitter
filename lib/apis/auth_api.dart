import 'package:appwrite/appwrite.dart';
import 'package:twitterclone/core/core.dart';

abstract class IAuthAPI{
  FutureEither<Account> signUp({
    required String email,
    required String password
  });
}