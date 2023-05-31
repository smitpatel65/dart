import 'package:flutter/material.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  List imageLIst = [
    "assets/icons/Booking_History.png",
    "assets/icons/Saved.png",
    "assets/icons/Membership.png",
    "assets/icons/My_Account.png",
    "assets/icons/Advertise_With_Us.png",
    "assets/icons/Refer_And_Earn.png",
    "assets/icons/Contact_Us.png",
    "assets/icons/Setting.png",
  ];

  List textList = [
    "Booking History",
    "Saved",
    "Membership",
    "My Account",
    "Advertise With Us",
    "Refer And Earn",
    "Contact Us",
    "Setting",
  ];

  List listIcons = [
    "assets/icons/Visit Website.png",
    "assets/icons/About Knocksense.png",
    "assets/icons/Terms and Conditions.png",
    "assets/icons/Privacy Policy.png",
    "assets/icons/Refun & Concellation Policy.png",
    "assets/icons/logout.png",
  ];

  List listText = [
    "Visit Website",
    "About Knocksense",
    "Terms and Conditions",
    "Privacy Policy",
    "Refun & Concellation Policy",
    "Logout",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(226, 11, 153, 175),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18.0,
                vertical: 25,
              ).copyWith(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Back',
                    style: TextStyle(color: Colors.white),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/icons/appbar_logo.png'),
                      const SizedBox(width: 5),
                      const Text(
                        'My Digest',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 4, 5, 6),
                    Color.fromARGB(255, 30, 44, 60),
                    Color.fromARGB(255, 30, 44, 60),
                    Color.fromARGB(255, 4, 5, 6),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 21, left: 20),
                        child: Image.asset('assets/icons/photo_up.png'),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 21,
                          left: 10,
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Vibhore',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                              ),
                            ),
                            Text(
                              'View profil',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 21, left: 135),
                            child: FloatingActionButton.extended(
                              onPressed: () {},
                              label: const Text(
                                'Platinum',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 166, 128, 48),
                                ),
                              ),
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 800,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1.0),
                      itemCount: 8,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 170,
                            width: 170,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(140, 36, 49, 64),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 37),
                              child: Column(
                                children: [
                                  Image.asset(imageLIst[index]),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 19,
                                    ),
                                    child: Text(
                                      textList[index].toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(
                    height: 50,
                    thickness: 1,
                    color: Colors.black,
                    indent: 20,
                    endIndent: 20,
                  ),
                  SizedBox(
                    height: 400,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Image.asset(listIcons[index]),
                          title: Text(
                            listText[index],
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 251, 99, 4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color.fromARGB(255, 251, 99, 4),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
