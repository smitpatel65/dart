import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class ExpansionTileCardDemo extends StatefulWidget {
  const ExpansionTileCardDemo({super.key});

  @override
  ExpansionTileCardDemoState createState() => ExpansionTileCardDemoState();
}

class ExpansionTileCardDemoState extends State<ExpansionTileCardDemo> {
  // final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('ExpansionTileCard Demo'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: ExpansionTileCard(
              baseColor: Colors.white,
              expandedColor: Colors.white,
              title: Row(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/parpelstar.png',
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "SELECT",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  const Column(
                    children: [
                      Text(
                        '₹5000',
                        style: TextStyle(fontSize: 20, color: Colors.yellow),
                      ),
                      Text(
                        '1 Year validity',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              trailing: const SizedBox.shrink(),
              children: <Widget>[
                const Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 4,
                      bottom: 15,
                      right: 20,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 39,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/icons/greentick.png',
                                height: 20,
                                width: 20,
                              ),
                              const Text(
                                'Free access to all knockksense events',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 39,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/icons/greentick.png',
                                height: 20,
                                width: 20,
                              ),
                              const Text(
                                '75 unlock',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 39,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/icons/greentick.png',
                                height: 20,
                                width: 20,
                              ),
                              const Expanded(
                                child: Text(
                                  "25 extra unlockon signing up with a referral code",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 39,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/icons/greentick.png',
                                height: 20,
                                width: 20,
                              ),
                              const Expanded(
                                child: Text(
                                  "5 Cash Vouchers of ₹1000 each, worth ₹5000",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 39,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/icons/greentick.png',
                                height: 20,
                                width: 20,
                              ),
                              const Expanded(
                                child: Text(
                                  "Cash Vouchers are fully redeemable, no min. bill value",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: ExpansionTileCard(
              baseColor: Colors.white,
              expandedColor: Colors.white,

              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/bluestar.png',
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "SELECT MINI",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const Column(
                    children: [
                      Text(
                        '₹2000',
                        style: TextStyle(fontSize: 20, color: Colors.yellow),
                      ),
                      Text(
                        '6 Month validity',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              trailing: const SizedBox.shrink(),
              //  subtitle: const Text("₹5000 \n 1year validity"),
              children: <Widget>[
                const Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 4,
                      bottom: 15,
                      right: 20,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 39,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/icons/greentick.png',
                                height: 20,
                                width: 20,
                              ),
                              const Text(
                                '40 Unlocks',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 39,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/icons/greentick.png',
                                height: 20,
                                width: 20,
                              ),
                              const Text(
                                '10 extra unlocks on signing up with a \n referral code',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 39,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/icons/greentick.png',
                                height: 20,
                                width: 20,
                              ),
                              const Expanded(
                                child: Text(
                                  "2 Cash Vouchres of ₹1000 each, worth ₹2000",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 39,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/icons/greentick.png',
                                height: 20,
                                width: 20,
                              ),
                              const Expanded(
                                child: Text(
                                  "5 Cash Vouchers of ₹1000 each, worth ₹5000",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: ExpansionTileCard(
              baseColor: Colors.white,
              expandedColor: Colors.white,

              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/silverstar.png',
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "PLATINUM",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const Column(
                    children: [
                      Text(
                        '₹599',
                        style: TextStyle(fontSize: 20, color: Colors.yellow),
                      ),
                      Text(
                        '12 Month validity',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              trailing: const SizedBox.shrink(),
              //  subtitle: const Text("₹5000 \n 1year validity"),
              children: <Widget>[
                const Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 4,
                      bottom: 15,
                      right: 20,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 39,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/icons/greentick.png',
                                height: 20,
                                width: 20,
                              ),
                              const Text(
                                '40 Unlocks',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 39,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/icons/greentick.png',
                                height: 20,
                                width: 20,
                              ),
                              const Text(
                                '10 extra unlocks on signing up with a  \n referral code',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 39,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/icons/greentick.png',
                                height: 20,
                                width: 20,
                              ),
                              const Expanded(
                                child: Text(
                                  "Earn upto ₹500 per referral",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: ExpansionTileCard(
              baseColor: Colors.white,
              expandedColor: Colors.white,

              title: Row(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/silverstar.png',
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "SILVER",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  const Column(
                    children: [
                      Text(
                        '99',
                        style: TextStyle(fontSize: 20, color: Colors.yellow),
                      ),
                      Text(
                        '1 Month validity',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              trailing: const SizedBox.shrink(),
              //  subtitle: const Text("₹5000 \n 1year validity"),
              children: <Widget>[
                const Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 4,
                      bottom: 15,
                      right: 20,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 39,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/icons/greentick.png',
                                height: 20,
                                width: 20,
                              ),
                              const Text(
                                '7 unlock',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 39,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/icons/greentick.png',
                                height: 20,
                                width: 20,
                              ),
                              const Expanded(
                                child: Text(
                                  "1 extra unlockon signing up with a referral code",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 39,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/icons/greentick.png',
                                height: 20,
                                width: 20,
                              ),
                              const Expanded(
                                child: Text(
                                  "Earn upto ₹300 per referral",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
