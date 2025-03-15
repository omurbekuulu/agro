part of 'agro_cubit.dart';

@immutable
class AgroState extends Equatable {
  const AgroState({
    this.weather,
    this.isValid = false,
  });

  final Weather? weather;
  final bool isValid;

  AgroState copyWith({
    Weather? weather,
    bool? isValid,
  }) {
    return AgroState(
      weather: weather ?? this.weather,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [
        weather!,
        isValid,
      ];
}
