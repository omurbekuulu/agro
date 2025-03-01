import 'package:agro/domain/pet/entities/pet.dart';
import 'package:dartz/dartz.dart';

abstract class PetsRepository {
  Future<Either> getPets();
  Future<Either> postPets(PetEntity pet);
}
