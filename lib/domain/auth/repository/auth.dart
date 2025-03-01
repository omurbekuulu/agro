import 'package:agro/data/auth/model/signin_req_params.dart';
import 'package:agro/data/auth/model/signup_req_params.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either> signup(SignupReqParams params);
  Future<Either> signin(SigninReqParams params);
  Future<bool> isLoggedIn();
}
