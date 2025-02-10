import 'package:agro/data/transaction/model/expense.dart';
import 'package:agro/domain/transaction/entity/expense.dart';

class ExpenseMapper {
  static ExpenseModel toModel(ExpenseEntity model) {
    return ExpenseModel(
      price: model.price,
      description: model.description,
      quantity: model.quantity,
    );
  }
}