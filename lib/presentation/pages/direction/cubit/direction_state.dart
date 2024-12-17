part of 'direction_cubit.dart';

@immutable
sealed class DirectionState {}

class LoadingDirections extends DirectionState {}

class LoadedDirections extends DirectionState {
  final List<DirectionEntity> directions;

  LoadedDirections({this.directions = const []});

  LoadedDirections copyWith({
    List<DirectionEntity>? directions,
  }) {
    return LoadedDirections(
      directions: directions ?? this.directions,
    );
  }
}

class FailureLaodDirections extends DirectionState {
  final String errorMessage;

  FailureLaodDirections({required this.errorMessage});
}