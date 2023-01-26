import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashtrip/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

final _firestore = FirebaseFirestore.instance;

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: const Text(
          'Pemesanan',
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => BottomNavBar()),
                  (route) => false);
            },
            child: const Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.lightBlue,
        shadowColor: Colors.white,
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: _firestore
              .collection('transactions')
              .orderBy('timestamp', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blueAccent,
                ),
              );
            }
            final transactions = snapshot.data!.docs;
            List<TransactionHistoryCard> transactioncards = [];
            for (var transaction in transactions) {
              final status = transaction['status'];
              final name = transaction['product-name'];
              final date = transaction['booking-date'];
              final time = transaction['time-open'];
              final bookingCode = transaction['booking-code'];
              final transactionData = TransactionHistoryCard(
                  status: status,
                  name: name,
                  date: date,
                  time: time,
                  bookingCode: bookingCode);
              if (user!.uid == transaction['uid']) {
                transactioncards.add(transactionData);
              }
            }
            return Expanded(
                child: ListView(
              children: transactioncards,
            ));
          },
        ),
      ),
    );
  }
}

class TransactionHistoryCard extends StatelessWidget {
  const TransactionHistoryCard({
    Key? key,
    required this.status,
    required this.name,
    required this.date,
    required this.time,
    required this.bookingCode,
  }) : super(key: key);
  final String status;
  final String name;
  final String date;
  final String time;
  final String bookingCode;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: (status == 'Proses')
                          ? Colors.orange
                          : (status == 'success')
                              ? Colors.green
                              : Colors.red,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0))),
                  height: 30.0,
                  width: 90.0,
                  child: Center(child: Text(status)),
                ),
                const SizedBox(
                  width: 50.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 20.0),
                    ),
                    // Row(
                    //   children: [
                    //     Text(orders[index].from),
                    //     const Icon(Icons.chevron_right),
                    //     Text(orders[index].to)
                    //   ],
                    // )
                  ],
                )
              ],
            ),
            const Divider(
              thickness: 3.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(date),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(time),
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                    height: 70.0,
                    width: 70.0,
                    child: Image.asset(
                      'assets/images/barcode.png',
                      fit: BoxFit.cover,
                    )),
                const SizedBox(
                  width: 10.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Kode Booking: ',
                      style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      bookingCode,
                      style: const TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
