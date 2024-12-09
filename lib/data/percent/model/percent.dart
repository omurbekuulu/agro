class PercentModel {
  final int? expense;
  final int? income;
  final int? performance;

  PercentModel({
    required this.expense,
    required this.income,
    required this.performance,
  });

  factory PercentModel.fromJson(Map<String, dynamic> json) {
    return PercentModel(
      expense: json['expenses'],
      income: json['income'],
      performance: json['performance'],
    );
  }
}
