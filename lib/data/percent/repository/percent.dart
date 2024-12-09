import 'package:agro/common/helper/mapper/percent.dart';
import 'package:agro/data/percent/model/percent.dart';
import 'package:agro/data/percent/source/percent.dart';
import 'package:agro/domain/percent/repository/percent.dart';
import 'package:agro/presentation/service_locator.dart';
import 'package:dartz/dartz.dart';

class PercentRepositoryImpl extends PercentRepository {
  @override
  Future<Either> getPercent(int petId) async {
    final responsePercent = await sl<PercentService>().getPercent(petId);

    return responsePercent.fold(
      (error) {
        return Left(error);
      },
      (data) {
        final percent = PercentMapper.toEntity(PercentModel.fromJson(data));
        return Right(percent);
      },
    );
  }
}
