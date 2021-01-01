import 'package:dealers/components/colors.dart';
import 'package:dealers/components/text/image_text.dart';
import 'package:dealers/components/utils/sabt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_icons/flutter_icons.dart';

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
                  )),
                  flexibleSpace: FlexibleSpaceBar(
                      background: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(24.0),
                        child: const ImageText(
                          image: 'https://outrider.live/assets/img/Chetan.jpg',
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
                                  labelPadding:
                                      EdgeInsets.only(left: 4, right: 8),
                                  label: Text("View Bills"),
                                )),
                            Container(
                                margin: EdgeInsets.symmetric(horizontal: 4.0),
                                child: GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                        backgroundColor: Colors.white,
                                        context: context,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight:
                                                    Radius.circular(4.0))),
                                        builder: (ctx) {
                                          return Container(
                                            padding: EdgeInsets.only(
                                                top: 16, right: 8, left: 8.0),
                                            child: Flex(
                                              direction: Axis.vertical,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    "Statements",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Gilroy SemiBold",
                                                        fontSize: 16.0),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: ListView.builder(
                                                    shrinkWrap: true,
                                                    itemCount: 1,
                                                    itemBuilder: (_ctx, index) {
                                                      return Container(
                                                          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 0.0),
                                                          child: ListTile(
                                                            onTap: () {},
                                                            shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(4.0)),
                                                            contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                                                            leading: Container(
                                                                width: 48.0,
                                                                decoration: BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .grey
                                                                            .withOpacity(
                                                                                0.5),
                                                                        width:
                                                                            0.5)),
                                                                child: Center(
                                                                    child: Icon(
                                                                  Feather.download_cloud,
                                                                  color: Colors
                                                                      .red,
                                                                  size: 20.0,
                                                                ))),
                                                            title: Column(
                                                              mainAxisSize: MainAxisSize.min,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: <
                                                                  Widget>[
                                                                Container(
                                                                  child: Text(
                                                                    "Statement #${index+1}",
                                                                    //"${state.invoices[index].retailer}",
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15.0),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin: EdgeInsets.only(top: 6.0),
                                                                  child: RichText(
                                                                    text: TextSpan(children: [
                                                                      TextSpan(
                                                                          text: "29 Dec",
                                                                          style: TextStyle(
                                                                              color: Colors.grey,
                                                                              fontSize: 12.0,
                                                                              fontWeight: FontWeight.w400)),
                                                                      TextSpan(
                                                                          text: " • ",
                                                                          style: TextStyle(
                                                                              color: Colors.grey,
                                                                              fontSize: 12.0,
                                                                              fontWeight: FontWeight.w500)),
                                                                      TextSpan(
                                                                          text: "\u20b917345.97",
                                                                          style: TextStyle(
                                                                              color: Colors.grey,
                                                                              fontSize: 13.0,
                                                                              fontWeight: FontWeight.w400))
                                                                    ]),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            trailing: Container(
                                                                child: Text(
                                                                    "\u20b929,882.87",
                                                                    //"\u20b9 ${state.invoices[index].amount.toStringAsFixed(2)}",
                                                                    style: TextStyle(
                                                                      fontFamily: "Gilroy SemiBold",
                                                                        color: Color(
                                                                            0XFF131B26),
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        fontSize:
                                                                            18.0))),
                                                          ));
                                                    })
                                                )
                                                
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                  child: Chip(
                                    backgroundColor:
                                        primaryColor.withOpacity(0.1),
                                    labelStyle: TextStyle(
                                      color: primaryColor,
                                      fontFamily: "Sailec",
                                      fontSize: 12.0,
                                    ),
                                    avatar: Icon(Boxicons.bx_receipt,
                                        size: 18.0, color: primaryColor),
                                    labelPadding:
                                        EdgeInsets.only(left: 4, right: 8),
                                    label: Text("View Statements"),
                                  ),
                                )),
                          ],
                        ),
                      )
                    ],
                  )),
                ),
                SliverPersistentHeader(
                  delegate: SliverHeaderDelegate(tabController: controller),
                  pinned: true,
                )
              ];
            },
            body: Container(
              padding: const EdgeInsets.only(top: 12.0),
              child: TabBarView(
                controller: controller,
                children: [
                  Container(
                    child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 8.0),
                            child: ListTile(
                              title: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Oil GOLD 1/2 litre 20L @₹44.55, - Srijan - KSDBMHGT5",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontFamily: "Gilroy SemiBold",
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(top: 8.0),
                                      child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "30 Dec",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w400)),
                                          TextSpan(
                                              text: " • ",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w500)),
                                          TextSpan(
                                              text: index % 2 == 0
                                                  ? "\u20b991489.54"
                                                  : "\u20b988,889.54",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.w400))
                                        ]),
                                      ))
                                ],
                              ),
                              trailing: Container(
                                  child: Text(
                                      index % 2 == 0
                                          ? "+\u20b92600.00"
                                          : "-\u20b9456.43",
                                      style: TextStyle(
                                          fontFamily: "Gilroy Regular",
                                          color: index % 2 == 0
                                              ? Color(0xff067d68)
                                              : dangerColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16.0))),
                            ));
                      },
                    ),
                  ),
                  Container(
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 8.0),
                            child: ListTile(
                              leading: Container(
                                  width: 48.0,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.grey.withOpacity(0.5),
                                          width: 0.5)),
                                  child: Center(
                                      child: Container(
                                    padding: EdgeInsets.all(0.0),
                                    height: 48.0,
                                    child: Image.network(
                                        "https://console.fuelcharge.in/static/images/banks/gpay.png"),
                                  ))),
                              title: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Payment of #8 statement",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontFamily: "Gilroy SemiBold",
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(top: 8.0),
                                      child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "30 Dec",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w400)),
                                          TextSpan(
                                              text: " • ",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w500)),
                                          TextSpan(
                                              text: "\u20b989345.97",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.w400))
                                        ]),
                                      ))
                                ],
                              ),
                              trailing: Container(
                                  child: Text("-\u20b912,600.00",
                                      style: TextStyle(
                                          fontFamily: "Gilroy Regular",
                                          color: dangerColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16.0))),
                            ));
                      },
                    ),
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
            text: "Ledger",
          ),
          Tab(
            text: "Tranasactions",
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
