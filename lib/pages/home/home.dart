import 'package:dealers/components/colors.dart';
import 'package:dealers/components/components.dart';
import 'package:dealers/components/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        height: 72.0,
        child: Card(
          margin: EdgeInsets.zero,
          child: BottomNavigationBar(
            elevation: 1,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black.withOpacity(0.24),
            selectedLabelStyle: const TextStyle(
              fontFamily: primaryFont,
              fontSize: 12.0,
              color: Colors.black
            ),  
            unselectedLabelStyle: TextStyle(
              fontFamily: primaryFont,
              fontSize: 12.0,
              color: Colors.black.withOpacity(0.24)
            ),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Boxicons.bx_home,
                  size: 22.0,
                ),
                label: "Home"
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Boxicons.bx_user,
                  size: 22.0,
                ),
                label: "Customers"
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Boxicons.bx_receipt,
                  size: 22.0,
                ),
                label: "Reports"
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Boxicons.bx_transfer,
                  size: 22.0,
                ),
                label: "Switch"
              )
            ],
          ),
        )
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 2,
            forceElevated: true,
            pinned: true,
            backgroundColor: Colors.white,
            expandedHeight: 120,
            toolbarHeight: 64.0,
            flexibleSpace: const FlexibleSpaceBar(
              titlePadding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0
              ),
              title: Text(
                "Hello, Chethan",
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontFamily: primaryFont,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black
                ),
              ),
            ),
            actions: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 16,
                    child: ClipOval(
                      child: Image.network(
                        'https://outrider.live/assets/img/Chetan.jpg',
                        width: 32,
                        height: 32,
                        fit: BoxFit.cover,
                      ),
                    ),                  ),
                )
              ],
            ),
            const SliverPadding(padding: EdgeInsets.symmetric(vertical: 8.0)),
           SliverToBoxAdapter(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(4.0),
                  child: Card(
                    elevation: 0,
                    color: const Color(0xFFE3FFEF),
                    shape: const RoundedRectangleBorder(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 6.0),
                            child: const Icon(
                              Boxicons.bxs_flame,
                              color: Color(0xFF37CF76),
                              size: 28.0,
                            )
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 6.0),
                            child: const Text(
                              "\u20b939,056.78",
                              style: TextStyle(
                                fontSize: 19.0,
                                fontFamily: primaryFont,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 6.0),
                            child: const Text(
                              "Fuel sales",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: primaryFont,
                                fontWeight: FontWeight.w400
                              ),
                            )
                          )
                        ],
                      )
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(4.0),
                  child: Card(
                    elevation: 0,
                    color: const Color(0xFFE3EDFF),
                    shape: const RoundedRectangleBorder(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 6.0),
                            child: const Icon(
                              Boxicons.bxs_store,
                              color: Color(0xFF297BFF),
                              size: 28.0,
                            )
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 6.0),
                            child: const Text(
                              "\u20b939,056.78",
                              style: TextStyle(
                                fontSize: 19.0,
                                fontFamily: primaryFont,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 6.0),
                            child: const Text(
                              "Lube sales",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: primaryFont,
                                fontWeight: FontWeight.w400
                              ),
                            )
                          )
                        ],
                      )
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(4.0),
                  child: Card(
                    elevation: 0,
                    color: const Color(0xFFFFEAE9),
                    shape: const RoundedRectangleBorder(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 6.0),
                            child: const Icon(
                              Boxicons.bx_rupee,
                              color: Color(0xFFFF5238),
                              size: 28.0,
                            )
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 6.0),
                            child: const Text(
                              "\u20b939,056.78",
                              style: TextStyle(
                                fontSize: 19.0,
                                fontFamily: primaryFont,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 6.0),
                            child: const Text(
                              "Expenses",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: primaryFont,
                                fontWeight: FontWeight.w400
                              ),
                            )
                          )
                        ],
                      )
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(4.0),
                  child: Card(
                    elevation: 0,
                    color: const Color(0xFFEDE4FF),
                    shape: const RoundedRectangleBorder(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 6.0),
                            child: const Icon(
                              Boxicons.bx_credit_card,
                              color: Color(0xFF5F11D7),
                              size: 28.0,
                            )
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 6.0),
                            child: const Text(
                              "\u20b939,056.78",
                              style: TextStyle(
                                fontSize: 19.0,
                                fontFamily: primaryFont,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 6.0),
                            child: const Text(
                              "Payments",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: primaryFont,
                                fontWeight: FontWeight.w400
                              ),
                            )
                          )
                        ],
                      )
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
