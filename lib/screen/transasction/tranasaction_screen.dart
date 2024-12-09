import 'package:flutter/material.dart';

import '../../widgets/neumorphic.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final TextEditingController searchController = TextEditingController();
  bool isClicked = false;
  int currentPage = 0;
  final int itemsPerPage = 12;

  // Sample Transactions Data
  final List<Map<String, dynamic>> transactions = [
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

  // Filtered transactions based on search query
  List<Map<String, dynamic>> filteredTransactions = [];

  @override
  void initState() {
    super.initState();
    filteredTransactions = transactions; // Initially show all transactions
    searchController.addListener(_SearchTransaction);
  }

  Future<void> _SearchTransaction() async {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredTransactions = transactions.where((transaction) {
        return transaction.values
            .any((value) => value.toString().toLowerCase().contains(query));
      }).toList();
      currentPage = 0; // Reset to the first page on new search
    });
  }

  final List<Map<String, String>> gridItems = [
    {'asset': 'assets/smartLogo.png', 'title': 'SMART'},
    {'asset': 'assets/Atmprovider.png', 'title': 'ATM'},
    {'asset': 'assets/globeLogo.png', 'title': 'Globe'},
    {'asset': 'assets/dgipay.png', 'title': 'Digi-Pay'},
    {'asset': 'assets/bayadcenter.png', 'title': 'Bayad Center'},
    {'asset': 'assets/ecpayprovider.png', 'title': 'ECPay'},
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _toggleClick() {
    setState(() {
      isClicked = !isClicked;
    });
  }

  List<Map<String, dynamic>> getPaginatedTransactions() {
    final startIndex = currentPage * itemsPerPage;
    final endIndex = (startIndex + itemsPerPage).clamp(0, transactions.length);
    // return transactions.sublist(startIndex, endIndex);

    return filteredTransactions.sublist(
      startIndex,
      endIndex > filteredTransactions.length
          ? filteredTransactions.length
          : endIndex,
    );
  }

  int get totalPages => (transactions.length / itemsPerPage).ceil();

  void _goToPreviousPage() {
    if (currentPage > 0) {
      setState(() {
        currentPage--;
      });
    }
  }

  void _goToNextPage() {
    if (currentPage < totalPages - 1) {
      setState(() {
        currentPage++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Transaction History',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 1.2,
            fontFamily: 'Roboto',
          ),
        ),
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: isClicked ? _buildNewContent() : _buildInitialGrid(),
    );
  }

  Widget _buildGridItem(String assetPath, String title) {
    return NeumorphicContainer(
      height: 300,
      width: 200,
      color: isClicked ? Colors.blue : Colors.grey.shade50,
      borderRadius: BorderRadius.circular(20),
      onTap: _toggleClick,
      padding: EdgeInsets.zero,
      shape: const CircleBorder(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            assetPath,
            width: 110,
            height: 60,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 10.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInitialGrid() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 15.0,
          childAspectRatio: 18 / 7,
        ),
        itemCount: gridItems.length,
        itemBuilder: (context, index) {
          final item = gridItems[index];
          return _buildGridItem(item['asset']!, item['title']!);
        },
      ),
    );
  }

  Widget _buildNewContent() {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 400,
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.search_rounded, size: 20),
                            hintText: 'Search...',
                            isDense: true,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 2),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                          width: 10), // Space between search bar and icons
                      IconButton(
                        icon: const Icon(Icons.filter_list,
                            size: 24, color: Colors.grey),
                        onPressed: () {
                          // Handle filter action
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.download_rounded,
                            size: 24, color: Colors.grey),
                        onPressed: () {
                          // Handle download action
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: DataTable(
                  headingRowColor: MaterialStateColor.resolveWith(
                      (states) => Colors.redAccent.shade200),
                  headingTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  columns: const [
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Date Created')),
                    DataColumn(label: Text('Transaction ID')),
                    DataColumn(label: Text('Amount')),
                    DataColumn(label: Text('Reference')),
                    DataColumn(label: Text('Balance')),
                    DataColumn(label: Text('Status')),
                  ],
                  rows: getPaginatedTransactions().asMap().entries.map((entry) {
                    final transaction = entry.value;
                    final index = entry.key;
                    return DataRow(
                      color: MaterialStateColor.resolveWith((states) =>
                          index.isEven ? Colors.grey[100]! : Colors.black),
                      cells: [
                        DataCell(Text(transaction['Name'] ?? '-')),
                        DataCell(Text(transaction['dateCreated'] ?? '-')),
                        DataCell(Text(transaction['transactionID'] ?? '-')),
                        DataCell(Text(transaction['amount'] ?? '-')),
                        DataCell(Text(transaction['reference'] ?? '-')),
                        DataCell(Text(transaction['balance'] ?? '-')),
                        DataCell(
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 8,
                            ),
                            decoration: BoxDecoration(
                              color: transaction['status'] == 'Success'
                                  ? Colors.green.withOpacity(0.2)
                                  : Colors.red.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              transaction['status'] ?? '-',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: transaction['status'] == 'Success'
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                  columnSpacing: 80.0,
                  headingRowHeight: 50.0,
                  border: TableBorder.all(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _goToPreviousPage,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Previous',
                      style: TextStyle(color: Colors.white)),
                ),
                Text('Page ${currentPage + 1} of $totalPages',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                ElevatedButton(
                  onPressed: _goToNextPage,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
