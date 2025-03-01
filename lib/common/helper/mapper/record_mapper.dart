import 'package:agro/data/transaction/models/record.dart';
import 'package:agro/domain/transaction/entities/record.dart';

class RecordMapper {
  static RecordModel toModel(RecordEntity model) {
    return RecordModel(
      price: model.price,
      description: model.description,
      quantity: model.quantity,
    );
  }
}
