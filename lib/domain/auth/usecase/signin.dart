import 'package:agro/core/usecase/usecase.dart';
import 'package:agro/data/auth/model/signin_req_params.dart';
import 'package:agro/domain/auth/repository/auth.dart';
import 'package:agro/presentation/service_locator.dart';
import 'package:dartz/dartz.dart';

class SigninUseCase extends UseCase<Either, SigninReqParams> {
  @override
  Future<Either> call({SigninReqParams? params}) async {
    return await sl<AuthRepository>().signin(params!);
  }
}
