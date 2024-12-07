import 'package:dartz/dartz.dart';

abstract class SeasonRepository {
  Future<Either> getSeasons();
}
