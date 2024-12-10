class TransactionModel {
  final int id;
  final String profit;
  final int price;
  final String description;
  final String transactionDate;
  final int userPetId;
  final int quantity;

  TransactionModel({
    required this.id,
    required this.profit,
    required this.price,
    required this.description,
    required this.transactionDate,
    required this.userPetId,
    required this.quantity,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      profit: json['id'],
      price: json['id'],
      description: json['id'],
      transactionDate: json['id'],
      userPetId: json['id'],
      quantity: json['id'],
    );
  }
}
