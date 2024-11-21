import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final int itemsPerPage = 15; // Number of items per page
  int currentPage = 0; // Current page index

  List<Map<String, dynamic>> transactions = [
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
      'Name': 'Diane',
      'dateCreated': '29 Jan 2021, 07:09 PM',
      'transactionID': '947228',
      'reference': '1000010114',
      'amount': '+1,800,000',
      'balance': '6,991,843',
      'status': 'Failed',
    },
    {
      'Name': 'Vincente',
      'dateCreated': '28 Jan 2021, 11:48 AM',
      'transactionID': '947228',
      'reference': '1000010114',
      'amount': '-16',
      'balance': '5,191,843',
      'status': 'Success',
    },
    {
      'Name': 'Raymond',
      'dateCreated': '28 Jan 2021, 11:48 AM',
      'transactionID': '947228',
      'reference': '1000010114',
      'amount': '+1,001',
      'balance': '5,191,859',
      'status': 'Success',
    },
    {
      'Name': 'Rico',
      'dateCreated': '27 Jan 2021, 01:56 PM',
      'transactionID': '947228',
      'reference': '10000101146',
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
      'Name': 'Rico',
      'dateCreated': '27 Jan 2021, 01:56 PM',
      'transactionID': '947228',
      'reference': '10000101146',
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
      'Name': 'Rico',
      'dateCreated': '27 Jan 2021, 01:56 PM',
      'transactionID': '947228',
      'reference': '10000101146',
      'amount': '-4,950',
      'balance': '5,190,858',
      'status': 'Failed',
    },
    {
      'Name': 'Raymond',
      'dateCreated': '28 Jan 2021, 11:48 AM',
      'transactionID': '947228',
      'reference': '1000010114',
      'amount': '+1,001',
      'balance': '5,191,859',
      'status': 'Success',
    },
    {
      'Name': 'Rico',
      'dateCreated': '27 Jan 2021, 01:56 PM',
      'transactionID': '947228',
      'reference': '10000101140566',
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
      'Name': 'Rico',
      'dateCreated': '27 Jan 2021, 01:56 PM',
      'transactionID': '947228',
      'reference': '10000101146',
      'amount': '-4,950',
      'balance': '5,190,858',
      'status': 'Failed',
    },
    {
      'Name': 'Raymond',
      'dateCreated': '28 Jan 2021, 11:48 AM',
      'transactionID': '947228',
      'reference': '100001011423',
      'amount': '+1,001',
      'balance': '5,191,859',
      'status': 'Success',
    },
    {
      'Name': 'Rico',
      'dateCreated': '27 Jan 2021, 01:56 PM',
      'transactionID': '947228',
      'reference': '1000010114566',
      'amount': '-4,950',
      'balance': '5,190,858',
      'status': 'Failed',
    },
    {
      'Name': 'Raymond',
      'dateCreated': '28 Jan 2021, 11:48 AM',
      'transactionID': '947228',
      'reference': '1000010114',
      'amount': '+1,001',
      'balance': '5,191,859',
      'status': 'Success',
    },
    {
      'Name': 'Rico',
      'dateCreated': '27 Jan 2021, 01:56 PM',
      'transactionID': '947228',
      'reference': '10000101146',
      'amount': '-4,950',
      'balance': '5,190,858',
      'status': 'Failed',
    },
    {
      'Name': 'Raymond',
      'dateCreated': '28 Jan 2021, 11:48 AM',
      'transactionID': '947228',
      'reference': '1000010114',
      'amount': '+1,001',
      'balance': '5,191,859',
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
      'Name': 'Rico',
      'dateCreated': '27 Jan 2021, 01:56 PM',
      'transactionID': '947228',
      'reference': '100001011466',
      'amount': '-4,950',
      'balance': '5,190,858',
      'status': 'Failed',
    },
    {
      'Name': 'Raymond',
      'dateCreated': '28 Jan 2021, 11:48 AM',
      'transactionID': '947228',
      'reference': '1000010114',
      'amount': '+1,001',
      'balance': '5,191,859',
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
  ];

  // Get paginated transactions for the current page
  List<Map<String, dynamic>> get paginatedTransactions {
    final startIndex = currentPage * itemsPerPage;
    final endIndex = startIndex + itemsPerPage;

    return transactions.sublist(
      startIndex,
      endIndex > transactions.length ? transactions.length : endIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transaction History',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 1.2,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      body: Column(
        children: [
          // Header Row
          Padding(
            padding: const EdgeInsets.only(left: 120.0, right: 60.0),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              color: Colors.grey[200],
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Date Created',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Transaction ID',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Reference',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Amount',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Balance',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Status',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Paginated Transaction List // read the ListView
          Expanded(
            child: ListView.builder(
              itemCount: paginatedTransactions.length,
              itemBuilder: (context, index) {
                final transaction = paginatedTransactions[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 120.0, right: 60.0),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 16,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                transaction['Name'],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                transaction['dateCreated'],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                transaction['transactionID'],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                transaction['reference'],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                transaction['amount'],
                                style: TextStyle(
                                  color: transaction['amount'].startsWith('-')
                                      ? Colors.red
                                      : Colors.green,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                transaction['balance'],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  Icon(
                                    transaction['status'] == 'Success'
                                        ? Icons.check_circle
                                        : Icons.error,
                                    color: transaction['status'] == 'Success'
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    transaction['status'],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(height: 1),
                    ],
                  ),
                );
              },
            ),
          ),
          // Pagination condition
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: currentPage > 0
                      ? () => setState(() => currentPage--)
                      : null,
                  child: const Text('Previous'),
                ),
                Text(
                    'Page ${currentPage + 1} of ${(transactions.length / itemsPerPage).ceil()}'),
                ElevatedButton(
                  onPressed:
                      (currentPage + 1) * itemsPerPage < transactions.length
                          ? () => setState(() => currentPage++)
                          : null,
                  child: const Text('Next'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
