import 'package:dartz/dartz.dart';

abstract class BreedsRepository {
  Future<Either> getBreeds();
  Future<Either> getSeasons();
}
