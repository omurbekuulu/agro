import 'package:agro/data/transaction/models/record.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/constants/api_url.dart';
import '../../../core/network/dio_client.dart';
import '../../../presentation/service_locator.dart';

abstract class IncomeService {
  Future<Either> postIncome(int userPetsId, bool isDecreas, RecordModel model);
}

class IncomeServiceImpl extends IncomeService {
  @override
  Future<Either> postIncome(
      int userPetsId, bool isDecreas, RecordModel model) async {
    try {
      var response = await sl<DioClient>().post(
        '${ApiUrl.postIncome}$userPetsId?decreases=$isDecreas',
        data: model.toJson(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data);
    }
  }
}
