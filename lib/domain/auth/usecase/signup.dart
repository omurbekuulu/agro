import 'package:agro/core/usecase/usecase.dart';
import 'package:agro/data/auth/model/signup_req_params.dart';
import 'package:agro/domain/auth/repository/auth.dart';
import 'package:agro/presentation/service_locator.dart';
import 'package:dartz/dartz.dart';

class SignupUseCase extends UseCase<Either, SignupReqParams> {
  @override
  Future<Either> call({SignupReqParams? params}) async {
    return await sl<AuthRepository>().signup(params!);
  }
}
