import 'package:agro/data/transaction/models/transaction.dart';
import 'package:agro/domain/transaction/entities/transaction.dart';

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
