import 'entities/season.dart';

abstract class SeasonRepository {
  Future<List<SeasonEntity>> getSeasons();
}
