import 'package:intl/intl.dart';

class Transaction {
  final String transactionId;
  final String agentRefNo;
  final TransactionData data;
  String remarks;
  final String timeNow;

  Transaction({
    required this.transactionId,
    required this.agentRefNo,
    required this.data,
    required this.remarks,
    required this.timeNow,
  });

  factory Transaction.fromJson(List<dynamic> json) {
    Map<String, dynamic> lastElement = json[4] as Map<String, dynamic>;

    return Transaction(
      transactionId: json[0] as String? ?? '', // Handle potential null
      agentRefNo: json[2] as String? ?? '', // Handle potential null
      data:
          TransactionData.fromJson(lastElement['data'] as Map<String, dynamic>),
      remarks: lastElement['remarks'] as String? ?? '', // Handle potential null
      timeNow:
          lastElement['time_now'] as String? ?? '', // Handle potential null
    );
  }

  Transaction copyWith({String? remarks}) {
    return Transaction(
      transactionId: transactionId,
      agentRefNo: agentRefNo,
      data: data,
      remarks: remarks ?? this.remarks,
      timeNow: timeNow,
    );
  }

  String get formattedTimeNow {
    try {
      DateTime dateTime;
      try {
        dateTime = DateFormat('yyyy/MM/dd HH:mm:ss').parse(timeNow);
      } catch (e) {
        dateTime = DateTime.parse(timeNow);
      }
      return DateFormat('MMMM dd yyyy h:mm a').format(dateTime);
    } catch (e) {
      return 'Invalid Date';
    }
  }
}

class TransactionData {
  final String? currentBalance;
  final String? convenienceFee;
  final String? cost;
  final String? denomination;
  final String? income;
  final String? mobileNo;
  final String? productCode;
  final String? referenceNo;
  final String? total;
  final String? transactionNo;

  TransactionData({
    this.currentBalance,
    this.convenienceFee,
    this.cost,
    this.denomination,
    this.income,
    this.mobileNo,
    this.productCode,
    this.referenceNo,
    this.total,
    this.transactionNo,
  });

  factory TransactionData.fromJson(Map<String, dynamic> json) {
    return TransactionData(
      currentBalance: json['currentBalance'] as String?,
      convenienceFee: json['convenienceFee'] as String?,
      cost: json['cost'] as String?,
      denomination: json['denomination'] as String?,
      income: json['income'] as String?,
      mobileNo: json['mobileNo'] as String?,
      productCode: json['productCode'] as String?,
      referenceNo: json['referenceNo'] as String?,
      total: json['total'] as String?,
      transactionNo: json['transactionNo'] as String?,
    );
  }
}
