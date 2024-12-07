import 'package:dartz/dartz.dart';

abstract class PetsRepository {
  Future<Either> getPets();
}
