import 'package:flutter/material.dart';

class Offer extends StatefulWidget {
  const Offer({super.key});

  @override
  State<Offer> createState() => _OfferState();
}

class _OfferState extends State<Offer> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 55,
                  width: 320,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Offer',
                      hintStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.grey),
                      ),
                      filled: false,
                    ),
                  ),
                ),
                Image.asset(
                  'assets/icons/filter.png',
                  height: 30,
                  width: 30,
                  color: Colors.grey,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 15,
                right: 13,
              ),
              child: Text(
                'Pick what makes you happy',
                style: TextStyle(
                  color: Color.fromARGB(255, 251, 226, 1),
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    CircleAvatar(
                        radius: 35,
                        backgroundImage: Image.asset(
                          'assets/icons/photo_up.png',
                        ).image),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Fashion &\n Lifestyle',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                        radius: 35,
                        backgroundImage: Image.asset(
                          'assets/icons/photo_up.png',
                        ).image),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Food',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                        radius: 35,
                        backgroundImage: Image.asset(
                          'assets/icons/photo_up.png',
                        ).image),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Drinks',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    CircleAvatar(
                        radius: 35,
                        backgroundImage: Image.asset(
                          'assets/icons/photo_up.png',
                        ).image),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Health &\n Wellness',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 12,
              width: 500,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    CircleAvatar(
                        radius: 35,
                        backgroundImage: Image.asset(
                          'assets/icons/photo_up.png',
                        ).image),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Freelancers-\n Personal',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                        radius: 35,
                        backgroundImage: Image.asset(
                          'assets/icons/photo_up.png',
                        ).image),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Fitness',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                        radius: 35,
                        backgroundImage: Image.asset(
                          'assets/icons/photo_up.png',
                        ).image),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Pet Wellness\n &Serices',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    CircleAvatar(
                        radius: 35,
                        backgroundImage: Image.asset(
                          'assets/icons/photo_up.png',
                        ).image),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Decor &\n interiors',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 12,
              width: 500,
            ),
            Visibility(
              visible: isVisible,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 12,
                          ),
                          CircleAvatar(
                              radius: 35,
                              backgroundImage: Image.asset(
                                'assets/icons/photo_up.png',
                              ).image),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'Bakeries &\n Sweets',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                              radius: 35,
                              backgroundImage: Image.asset(
                                'assets/icons/photo_up.png',
                              ).image),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'Salon &\n Makeuo',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                              radius: 35,
                              backgroundImage: Image.asset(
                                'assets/icons/photo_up.png',
                              ).image),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'Co-Working&\n Real Estate',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 12,
                          ),
                          CircleAvatar(
                              radius: 35,
                              backgroundImage: Image.asset(
                                'assets/icons/photo_up.png',
                              ).image),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'Activities',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                    width: 500,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 12,
                          ),
                          CircleAvatar(
                              radius: 35,
                              backgroundImage: Image.asset(
                                'assets/icons/photo_up.png',
                              ).image),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'Automobiles',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                              radius: 35,
                              backgroundImage: Image.asset(
                                'assets/icons/photo_up.png',
                              ).image),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'Tea Bar',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                              radius: 35,
                              backgroundImage: Image.asset(
                                'assets/icons/photo_up.png',
                              ).image),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'Others',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 12,
                          ),
                          CircleAvatar(
                              radius: 35,
                              backgroundImage: Image.asset(
                                'assets/icons/photo_up.png',
                              ).image),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'Decor &\n interiors',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
              width: 300,
            ),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              icon: const Icon(
                Icons.arrow_drop_down,
                size: 24.0,
              ),
              label: const Text('View more'),
            ),
          ],
        ),
      ),
    );
  }
}
