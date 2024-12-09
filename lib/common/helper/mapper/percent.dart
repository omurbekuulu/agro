import 'package:agro/data/percent/model/percent.dart';
import 'package:agro/domain/percent/entity/percent.dart';

class PercentMapper {
  static PercentEntity toEntity(PercentModel model) {
    return PercentEntity(
      expense: model.expense,
      income: model.income,
      performance: model.performance,
    );
  }
}
