import 'package:dartz/dartz.dart';

abstract class ProfitabilityRepository {
  Future<Either> getProfitability(int directionId);
}
