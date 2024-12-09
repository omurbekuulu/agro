import 'package:agro/common/helper/mapper/direction.dart';
import 'package:agro/data/directions/model/direction.dart';
import 'package:agro/data/directions/source/directions.dart';
import 'package:agro/domain/directions/repository/directions.dart';
import 'package:agro/presentation/service_locator.dart';
import 'package:dartz/dartz.dart';

class DirectionsRepositoryImpl extends DirectionsRepository {
  @override
  Future<Either> getDirections(int categoryId) async {
    final responseData =
        await sl<DirectionsService>().getDirections(categoryId);

    return responseData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        final directions = List.from(data)
            .map((item) =>
                DirectionMapper.toEntity(DirectionModel.fromJson(item)))
            .toList();

        return Right(directions);
      },
    );
  }
}
