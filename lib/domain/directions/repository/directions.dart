import 'package:dartz/dartz.dart';

abstract class DirectionsRepository {
  Future<Either> getDirections(int categoryId);
}
