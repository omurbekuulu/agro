import 'package:dartz/dartz.dart';

abstract class AddNewBreedRepository {
  Future<Either> getBreeds();
  Future<Either> getSeasons();
}
