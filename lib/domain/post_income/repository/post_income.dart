import 'package:dartz/dartz.dart';

abstract class PostIncomeRepository {
  Future<Either> postPets();
}
