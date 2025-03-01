class TransactionEntity {
  final int id;
  final String profit;
  final int price;
  final String description;
  final String transactionDate;
  final int userPetId;
  final int quantity;

  TransactionEntity({
    required this.id,
    required this.profit,
    required this.price,
    required this.description,
    required this.transactionDate,
    required this.userPetId,
    required this.quantity,
  });
}
