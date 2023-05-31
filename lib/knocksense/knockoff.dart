import 'dart:developer';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'tapbarview.dart';

class KnockOff extends StatefulWidget {
  const KnockOff({super.key});

  @override
  State<KnockOff> createState() => _KnockOffState();
}

GlobalKey<ExpansionTileCardState> cardA1 = GlobalKey();
GlobalKey<ExpansionTileCardState> cardA2 = GlobalKey();
GlobalKey<ExpansionTileCardState> cardA3 = GlobalKey();
GlobalKey<ExpansionTileCardState> cardA4 = GlobalKey();

class _KnockOffState extends State<KnockOff> with TickerProviderStateMixin {
  bool isExpanded1 = true;
  bool isExpanded2 = false;
  bool isExpanded3 = false;
  bool isExpanded4 = false;

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 30,
                              left: 10,
                            ),
                            child: Text('Your Location',
                                style: TextStyle(
                                  color: Color.fromARGB(168, 255, 255, 255),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 20,
                            ),
                            child: Text(
                              'Ahmedabad  >',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications,
                            color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                ),
                child: Center(
                  child: Image.asset(
                    "assets/icons/knLogo.png",
                    height: 130,
                    width: 130,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.file_present_rounded,
                              color: Colors.white),
                        ),
                        const Text(
                          'Daily news digest at your perferred time',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 48,
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.file_present_rounded,
                                color: Colors.white),
                          ),
                          const Text(
                            'Exclusive Deals and Offers',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.file_present_rounded,
                              color: Colors.white),
                        ),
                        const Text(
                          'Zero convenience fee on event booking.',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'Choose Membership plan         ',
                      style:
                          TextStyle(color: Color.fromARGB(255, 226, 226, 63)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20),
                              child: ExpansionTileCard(
                                key: cardA1,
                                onExpansionChanged: (value) {
                                  isExpanded1 = value;
                                  setState(() {
                                    if (isExpanded2 == true ||
                                        isExpanded3 == true ||
                                        isExpanded4 == true) {
                                      cardA2.currentState?.collapse();
                                      cardA3.currentState?.collapse();
                                      cardA4.currentState?.collapse();
                                      log(isExpanded1.toString(),
                                          name: "Expanded 2");
                                    } else {
                                      cardA1.currentState?.expand();
                                    }
                                  });
                                },
                                initiallyExpanded: isExpanded1,
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
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.yellow),
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
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
                            // Expanded 2
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20),
                              child: ExpansionTileCard(
                                key: cardA2,
                                onExpansionChanged: (value) {
                                  isExpanded2 = value;
                                  setState(() {
                                    if (isExpanded1 == true ||
                                        isExpanded3 == true ||
                                        isExpanded4 == true) {
                                      log(isExpanded2.toString(),
                                          name: "Expanded 2");
                                      cardA1.currentState?.collapse();
                                      cardA3.currentState?.collapse();
                                      cardA4.currentState?.collapse();
                                    } else {
                                      cardA2.currentState?.expand();
                                    }
                                  });
                                },
                                initiallyExpanded: isExpanded2,
                                baseColor: Colors.white,
                                expandedColor: Colors.white,
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.yellow),
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20),
                              child: ExpansionTileCard(
                                key: cardA3,
                                onExpansionChanged: (value) {
                                  isExpanded3 = value;
                                  setState(() {
                                    if (isExpanded2 == true ||
                                        isExpanded1 == true ||
                                        isExpanded4 == true) {
                                      cardA2.currentState?.collapse();
                                      cardA1.currentState?.collapse();
                                      cardA4.currentState?.collapse();
                                      log(isExpanded1.toString(),
                                          name: "Expanded 2");
                                    } else {
                                      cardA3.currentState?.expand();
                                    }
                                  });
                                },
                                initiallyExpanded: isExpanded3,
                                baseColor: Colors.white,
                                expandedColor: Colors.white,

                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.yellow),
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20),
                              child: ExpansionTileCard(
                                key: cardA4,
                                onExpansionChanged: (value) {
                                  isExpanded4 = value;
                                  setState(() {
                                    if (isExpanded2 == true ||
                                        isExpanded3 == true ||
                                        isExpanded1 == true) {
                                      cardA2.currentState?.collapse();
                                      cardA1.currentState?.collapse();
                                      cardA3.currentState?.collapse();
                                      log(isExpanded1.toString(),
                                          name: "Expanded 2");
                                    } else {
                                      cardA4.currentState?.expand();
                                    }
                                  });
                                },
                                initiallyExpanded: isExpanded4,
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
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.yellow),
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
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
                        Container(
                          height: 50,
                          width: 350,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            //color: Colors.yellow
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(255, 200, 206, 11),
                                Color.fromARGB(210, 196, 182, 35),
                              ],
                            ),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'View Details',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SingleChildScrollView(
                          child: Container(
                            width: 600,
                            height: 860,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              color: Colors.black,
                            ),
                            child: Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 30,
                                        ),
                                        child: Container(
                                          height: 55,
                                          width: 350,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: const Color.fromARGB(
                                                255, 19, 18, 18),
                                          ),
                                          child: TabBar(
                                            controller: tabController,
                                            labelColor: const Color.fromARGB(
                                                255, 200, 206, 11),
                                            unselectedLabelColor: Colors.white,
                                            indicator: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  161, 44, 43, 43),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(35),
                                                bottomLeft: Radius.circular(35),
                                              ),
                                            ),
                                            tabs: const [
                                              Tab(
                                                text: 'Offer & Deals',
                                              ),
                                              Tab(
                                                text: 'Events',
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      controller: tabController,
                                      children: <Widget>[
                                        const Offer(),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            color: Colors.orangeAccent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
