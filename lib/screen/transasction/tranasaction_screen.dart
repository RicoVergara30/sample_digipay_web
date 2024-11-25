import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  //-----ist of transaction-----//
  final List<String> transactionTypes = [
    "ECPAY",
    "ATM",
    "DIGI-PAY",
    "SMART",
    "BAYAD CENTER",
    "GLOBE",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Transaction History",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 1.2,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      //-----Box Adjustment-----//
      body: Padding(
        padding: const EdgeInsets.only(left: 70.0, right: 10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Number of columns
            crossAxisSpacing: 15.0, // Space between columns
            mainAxisSpacing: 15.0, // Space between rows
            childAspectRatio: 3.5, // Adjust height/width of each grid item
          ),
          itemCount: transactionTypes.length,
          itemBuilder: (context, index) {
            return _buildCard(transactionTypes[index]);
          },
        ),
      ),
    );
  }

  //-----clickable card for each transaction type-----//
  Widget _buildCard(String title) {
    return GestureDetector(
      onTap: () {
        // Navigate to the respective screen with a table of details
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                TransactionDetailScreen(transactionType: title),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TransactionDetailScreen extends StatelessWidget {
  final String transactionType;

  const TransactionDetailScreen({
    Key? key,
    required this.transactionType,
  }) : super(key: key);

  //-----Sample data for each transaction type to be displayed in the table-----//
  List<Map<String, String>> _getTransactionDetails() {
    switch (transactionType) {
      case "ECPAY":
        return [
          {
            'Name': 'Lorenzo',
            'dateCreated': '29 Jan 2021, 07:09 PM',
            'transactionID': '947228',
            'reference': '1000010114',
            'amount': '-4,950',
            'balance': '6,986,893',
            'status': 'Success',
          },
          {
            'Name': 'Rico',
            'dateCreated': '27 Jan 2021, 01:56 PM',
            'transactionID': '947228',
            'reference': '1000010114',
            'amount': '-4,950',
            'balance': '5,190,858',
            'status': 'Failed',
          },
          {
            'Name': 'Raymond',
            'dateCreated': '28 Jan 2021, 11:48 AM',
            'transactionID': '947228',
            'reference': '10000101143',
            'amount': '+1,001',
            'balance': '5,191,859',
            'status': 'Success',
          },
          {
            "Name": "John Doe",
            "dateCreated": "2024-11-01",
            "transactionID": "TXN123",
            "amount": "\$100.00",
            "reference": "Ref1234",
            "balance": "\$500.00",
            "status": "Completed"
          },
          {
            "Name": "Jane Smith",
            "dateCreated": "2024-11-02",
            "transactionID": "TXN124",
            "amount": "\$150.00",
            "reference": "Ref1235",
            "balance": "\$350.00",
            "status": "Pending"
          },
          {
            "Name": "Michael Johnson",
            "dateCreated": "2024-11-03",
            "transactionID": "TXN125",
            "amount": "\$200.00",
            "reference": "Ref1236",
            "balance": "\$150.00",
            "status": "Failed"
          },
        ];
      case "ATM":
        return [
          {
            'Name': 'Lorenzo',
            'dateCreated': '29 Jan 2021, 07:09 PM',
            'transactionID': '947228',
            'reference': '1000010114',
            'amount': '-4,950',
            'balance': '6,986,893',
            'status': 'Success',
          },
          {
            'Name': 'Rico',
            'dateCreated': '27 Jan 2021, 01:56 PM',
            'transactionID': '947228',
            'reference': '1000010114',
            'amount': '-4,950',
            'balance': '5,190,858',
            'status': 'Failed',
          },
          {
            'Name': 'Raymond',
            'dateCreated': '28 Jan 2021, 11:48 AM',
            'transactionID': '947228',
            'reference': '10000101143',
            'amount': '+1,001',
            'balance': '5,191,859',
            'status': 'Success',
          },
          {
            "Name": "John Doe",
            "dateCreated": "2024-11-01",
            "transactionID": "TXN123",
            "amount": "\$100.00",
            "reference": "Ref1234",
            "balance": "\$500.00",
            "status": "Completed"
          },
          {
            "Name": "Jane Smith",
            "dateCreated": "2024-11-02",
            "transactionID": "TXN124",
            "amount": "\$150.00",
            "reference": "Ref1235",
            "balance": "\$350.00",
            "status": "Pending"
          },
          {
            "Name": "Michael Johnson",
            "dateCreated": "2024-11-03",
            "transactionID": "TXN125",
            "amount": "\$200.00",
            "reference": "Ref1236",
            "balance": "\$150.00",
            "status": "Failed"
          },
        ];

      default:
        return [
          {
            'Name': 'Lorenzo',
            'dateCreated': '29 Jan 2021, 07:09 PM',
            'transactionID': '947228',
            'reference': '1000010114',
            'amount': '-4,950',
            'balance': '6,986,893',
            'status': 'Success',
          },
          {
            "Name": "John Doe",
            "dateCreated": "2024-11-01",
            "transactionID": "TXN123",
            "amount": "\$100.00",
            "reference": "Ref1234",
            "balance": "\$500.00",
            "status": "Completed"
          },
          {
            "Name": "Jane Smith",
            "dateCreated": "2024-11-02",
            "transactionID": "TXN124",
            "amount": "\$150.00",
            "reference": "Ref1235",
            "balance": "\$350.00",
            "status": "Pending"
          },
          {
            "Name": "Michael Johnson",
            "dateCreated": "2024-11-03",
            "transactionID": "TXN125",
            "amount": "\$200.00",
            "reference": "Ref1236",
            "balance": "\$150.00",
            "status": "Failed"
          },
          {
            "Name": "John Doe",
            "dateCreated": "2024-11-01",
            "transactionID": "TXN123",
            "amount": "\$100.00",
            "reference": "Ref1234",
            "balance": "\$500.00",
            "status": "Completed"
          },
          {
            "Name": "Jane Smith",
            "dateCreated": "2024-11-02",
            "transactionID": "TXN124",
            "amount": "\$150.00",
            "reference": "Ref1235",
            "balance": "\$350.00",
            "status": "Pending"
          },
          {
            "Name": "Michael Johnson",
            "dateCreated": "2024-11-03",
            "transactionID": "TXN125",
            "amount": "\$200.00",
            "reference": "Ref1236",
            "balance": "\$150.00",
            "status": "Failed"
          },
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          transactionType,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              'Details for $transactionType',
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.only(left: 100.0, right: 50.0),
            child: DataTable(
              //----- display the data-----//
              columns: const [
                DataColumn(
                  label: Text(
                    'Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'dateCreated',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'transactionID',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'amount',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'reference',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'balance',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'status',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              rows: _getTransactionDetails()
                  .map(
                    (transaction) => DataRow(
                      cells: [
                        DataCell(Text(transaction["Name"]!)),
                        DataCell(Text(transaction["dateCreated"]!)),
                        DataCell(Text(transaction["transactionID"]!)),
                        DataCell(Text(transaction["amount"]!)),
                        DataCell(Text(transaction["reference"]!)),
                        DataCell(
                          Text(transaction["balance"]!),
                        ),
                        DataCell(
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 8),
                            decoration: BoxDecoration(
                              color: transaction["status"] == "Completed"
                                  ? Colors.green.withOpacity(0.2)
                                  : transaction["status"] == "Pending"
                                      ? Colors.orange.withOpacity(0.2)
                                      : Colors.red.withOpacity(
                                          0.2), // Background based on status
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              transaction["status"]!,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: transaction["status"] == "Completed"
                                    ? Colors.green
                                    : transaction["status"] == "Pending"
                                        ? Colors.orange
                                        : Colors
                                            .red, // Text color based on status
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
              columnSpacing: 95.0,
              headingRowHeight: 50.0,
              border: TableBorder.all(),
            ),
          ),
        ],
      ),
    );
  }
}
