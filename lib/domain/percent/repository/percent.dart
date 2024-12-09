import 'package:dartz/dartz.dart';

abstract class PercentRepository {
  Future<Either> getPercent(int petId);
}
