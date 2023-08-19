import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../util/buttonListener.dart';
import '../util/cardDisplay.dart';
import '../util/widgetList.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // page controller
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink,
        child: const Icon(
          Icons.monetization_on,
          size: 32,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.home,
                  size: 32,
                  color: Color.fromARGB(255, 216, 113, 147),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings,
                  size: 32,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(children: [
          // appbar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Text(
                      "My",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " Cards",
                      style: TextStyle(fontSize: 28),
                    ),
                  ],
                ),

                // plus button
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 174, 185, 179), shape: BoxShape.circle),
                    child: const Icon(Icons.add)),
              ],
            ),
          ),

          const SizedBox(
            height: 25,
          ),

          // cards
          SizedBox(
            height: 200,
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              children: const [
                MyCard(
                  balance: 69.20,
                  cardNumber: 12345678,
                  expiryMonth: 10,
                  expiryYear: 24,
                  color: Color.fromARGB(255, 160, 83, 73),
                ),
                MyCard(
                  balance: 199.29,
                  cardNumber: 12345678,
                  expiryMonth: 10,
                  expiryYear: 28,
                  color: Color.fromARGB(255, 176, 195, 152),
                ),
                MyCard(
                  balance: 420.20,
                  cardNumber: 12345678,
                  expiryMonth: 07,
                  expiryYear: 24,
                  color: Color.fromARGB(255, 215, 133, 240),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect:
                  ExpandingDotsEffect(activeDotColor: Colors.grey.shade800)),

          const SizedBox(height: 25),

          // 3 buttons -> send + pay + bills
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // send
                MyButton(
                    iconImagePath: "lib/icons/send-money.png",
                    buttonText: "Send"),

                // pay
                MyButton(
                    iconImagePath: "lib/icons/credit-card.png",
                    buttonText: "Pay"),

                // bills
                MyButton(
                    iconImagePath: "lib/icons/bill.png", buttonText: "Bills"),
              ],
            ),
          ),

          const SizedBox(height: 40),

          // column -> stats + transactions
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                // statistics
                MyListTile(
                    iconImagePath: "lib/icons/statistics.png",
                    tileTitle: "Statistics",
                    tileSubtitle: "Payment and Income"),
                // transactions
                MyListTile(
                    iconImagePath: "lib/icons/transaction.png",
                    tileTitle: "Transactions",
                    tileSubtitle: "Transaction History"),
              ],
            ),
          )
        ]),
      ),
    );
  }
}


// 36:32
