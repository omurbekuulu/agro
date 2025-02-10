class ExpenseModel {
  final int price;
  final String description;
  final int quantity;

  ExpenseModel({
    required this.price,
    required this.description,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'description': description,
      'quantity': quantity,
    };
  }
}
