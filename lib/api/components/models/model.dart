class Transaction {
  final String monthOf;
  final int successfulTransaction;

  Transaction({
    required this.monthOf,
    required this.successfulTransaction,
  });

  // Factory method to parse JSON into the model
  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      monthOf: json['month_of'],
      successfulTransaction: json['successful_transaction'],
    );
  }
}
