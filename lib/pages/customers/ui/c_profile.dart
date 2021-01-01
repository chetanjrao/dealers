import 'package:dealers/components/colors.dart';
import 'package:dealers/components/text/image_text.dart';
import 'package:dealers/components/utils/sabt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

class CustomerProfile extends StatefulWidget {
  @override
  _CustomerProfileState createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: NestedScrollView(
            headerSliverBuilder: (context, isScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  elevation: 0,
                  backgroundColor: Colors.white,
                  expandedHeight: 250.0,
                  titleSpacing: 0,
                  leading: const BackButton(
                    color: Colors.black,
                  ),
                  title: const SABT(
                      child: Text(
                      "Yadav Logistics",
                      style: TextStyle(color: Colors.black),
                    )
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.all(24.0),
                            child: const ImageText(
                              image:
                                  'https://outrider.live/assets/img/Chetan.jpg',
                              title: "Yadav Logistics",
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 0.0),
                            child: const Text(
                              "Yadav Logistics",
                              style: TextStyle(
                                  fontSize: 24.0,
                                  fontFamily: "Gilroy Regular",
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8.0),
                            child: const Text(
                              "Credit Balance: \u20b934,4555.00",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: "Gilroy Regular",
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                                  child: Chip(
                                    backgroundColor: logoColor.withOpacity(0.1),
                                    avatar: Icon(
                                      Boxicons.bx_file,
                                      size: 18.0,
                                      color: logoColor,
                                    ),
                                    labelStyle: TextStyle(
                                      color: logoColor,
                                      fontFamily: "Sailec",
                                      fontSize: 12.0,
                                    ),
                                    labelPadding: EdgeInsets.only(left: 4, right: 8),
                                    label: Text("View Bills"),
                                  )
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                                  child: Chip(
                                    backgroundColor: primaryColor.withOpacity(0.1),
                                    labelStyle: TextStyle(
                                      color: primaryColor,
                                      fontFamily: "Sailec",
                                      fontSize: 12.0,
                                    ),
                                    avatar: Icon(
                                      Boxicons.bx_receipt,
                                      size: 18.0,
                                      color: primaryColor
                                    ),
                                    labelPadding: EdgeInsets.only(left: 4, right: 8),
                                    label: Text("View Statements"),
                                  )
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                  ),
                ),
                SliverPersistentHeader(
                  delegate: SliverHeaderDelegate(tabController: controller),
                  pinned: true,
                )
              ];
            },
            body: Container(
              child: TabBarView(
                controller: controller,
                children: [
                  Container(
                    child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Container(
                            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                            child: ListTile(
                              title: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Oil GOLD 1/2 litre 20L @₹44.55, - Srijan - KSDBMHGT5",
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 8.0),
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "30 Dec",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w500
                                            )
                                          ),
                                          TextSpan(
                                            text: " • ",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w500
                                            )
                                          ),
                                          TextSpan(
                                            text: "\u20b988,889.54",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w500
                                            )
                                          )
                                        ]
                                      ),
                                    )
                                  )
                                ],
                              ),
                              trailing: Container(
                                  child: Text( index % 2 == 0 ? "+\u20b92600.00" : "-\u20b9456.43",
                                      style: TextStyle(
                                        fontFamily: "Gilroy Regular",
                                          color:  index % 2 == 0 ? Color(0xff067d68) : dangerColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16.0))),
                            ));
                      },
                    ),
                  ),
                  Container(

                  )
                ],
              ),
            ),
          )),
    );
  }
}

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final TabController tabController;

  const SliverHeaderDelegate({@required this.tabController}) : super();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      borderRadius: BorderRadius.circular(2.0),
      elevation: 2,
      color: Colors.white,
      child: TabBar(
        isScrollable: true,
        controller: tabController,
        indicatorColor: primaryColor,
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: primaryColor,
        unselectedLabelColor: const Color(0xff404864),
        labelStyle:
            const TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Sailec'),
        tabs: const <Widget>[
          Tab(
            text: "Credit",
          ),
          Tab(
            text: "Debit",
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 40.0;

  @override
  double get minExtent => 40.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
