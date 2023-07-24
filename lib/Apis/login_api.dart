import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/rendering.dart';
import 'package:notesblocapp/models.dart';

@immutable
abstract class LoginApiProtocol {
  const LoginApiProtocol();
  Future<LoginHandler?> login(
      {required String email, required String password});
}

@immutable
class LoginApi implements LoginApiProtocol {
  // const LoginApi._sharedInstance();
  // static const LoginApi _shared = LoginApi._sharedInstance();
  // factory LoginApi.instance() => _shared;
  @override
  Future<LoginHandler?> login(
      {required String email, required String password}) => Future.delayed(
        const Duration(seconds: 2,)
,() =>  email == 'awais@gmail.com' && password == 'awais@2023'  ).then((isLogedIn) => isLogedIn ? const LoginHandler.logData() : null);
}
