import 'package:agro/data/transaction/model/transaction.dart';
import 'package:agro/domain/transaction/entity/transaction.dart';

class TransactionMapper {
  static TransactionEntity toEntity(TransactionModel model) {
    return TransactionEntity(
      id: model.id,
      profit: model.profit,
      price: model.price,
      description: model.description,
      transactionDate: model.transactionDate,
      userPetId: model.userPetId,
      quantity: model.quantity,
    );
  }
}
