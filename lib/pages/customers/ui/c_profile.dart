import 'dart:convert';

import 'package:dealers/api/client.dart';
import 'package:dealers/components/colors.dart';
import 'package:dealers/components/text/image_text.dart';
import 'package:dealers/components/utils/sabt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:dealers/api/constants.dart';
import 'package:shimmer/shimmer.dart';

class CustomerProfile extends StatefulWidget {
  final String code;
  final dynamic customer;

  const CustomerProfile({Key key, @required this.code, @required this.customer})
      : super(key: key);

  @override
  _CustomerProfileState createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile>
    with SingleTickerProviderStateMixin {
  TabController controller;
  bool isLoading = true;
  dynamic jsonResponse;
  int length = 0;
  final GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
  final APIClient apiClient = new APIClient();

  void getData() async {
    setState(() {
      isLoading = true;
    });
    Response response =
        await apiClient.getCustomerProfile(widget.code, widget.customer);
    dynamic _jsonReponse = jsonDecode(response.body);
    setState(() {
      jsonResponse = _jsonReponse;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 1, vsync: this);
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: isLoading
              ? Center(
                  child: ListView.builder(
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return Container(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            child: ListTile(
                              leading: Shimmer.fromColors(
                                baseColor: Colors.grey[200],
                                highlightColor: Colors.grey[100],
                                child: Container(
                                    width: 48.0,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.grey.withOpacity(0.5),
                                            width: 0.5))),
                              ),
                              title: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      child: Shimmer.fromColors(
                                          baseColor: Colors.grey[200],
                                          highlightColor: Colors.grey[100],
                                          child: Container(
                                            width: double.infinity,
                                            height: 16.0,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                color: Colors.white),
                                          ))),
                                  Container(
                                    margin: EdgeInsets.only(top: 12.0),
                                    child: Container(
                                        child: Shimmer.fromColors(
                                            baseColor: Colors.grey[200],
                                            highlightColor: Colors.grey[100],
                                            child: Container(
                                              width: double.infinity,
                                              height: 13.0,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  color: Colors.white),
                                            ))),
                                  )
                                ],
                              ),
                              trailing: Container(
                                  child: Shimmer.fromColors(
                                      baseColor: Colors.grey[200],
                                      highlightColor: Colors.grey[100],
                                      child: Container(
                                        height: 24,
                                        width: 24,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white),
                                      ))),
                            ));
                      }))
              : NestedScrollView(
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
                        title: SABT(
                            child: Text(
                          "${jsonResponse["name"]}",
                          style: TextStyle(color: Colors.black),
                        )),
                        flexibleSpace: FlexibleSpaceBar(
                            background: Column(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.all(24.0),
                              child: ImageText(
                                title: "${jsonResponse["name"]}",
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 0.0),
                              child: Text(
                                "${jsonResponse["name"]}",
                                style: TextStyle(
                                    fontSize: 24.0,
                                    fontFamily: "Gilroy Regular",
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 8.0),
                              child: Text(
                                "Credit Balance: \u20b9${jsonResponse["balance"]}",
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
                                  GestureDetector(
                                    onTap: () async{
                                      DateTime now = DateTime.now();
                                      DateTime firstday =
                                          DateTime(now.year, now.month, 1);
                                      DateTime lastday =
                                          DateTime(now.year, now.month + 1, 0);
                                      var formatter = DateFormat('yyyy-MM-dd');
                                        final bool _canLaunch = await canLaunch(
                                            "$apiUrl/console/${widget.code}/api/bills/customers/${widget.customer}/reciept/?from=${formatter.format(firstday)}&to=${formatter.format(lastday)}");
                                        if (_canLaunch) {
                                          await launch("$apiUrl/console/${widget.code}/api/bills/customers/${widget.customer}/reciept/?from=${formatter.format(firstday)}&to=${formatter.format(lastday)}");
                                        }
                                    },
                                    child: 
                                  Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      child: Chip(
                                        backgroundColor:
                                            logoColor.withOpacity(0.1),
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
                                        label: Text("View Monthly Bill"),
                                      )),
                                  ),
                                  Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                              backgroundColor: Colors.white,
                                              context: context,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0))),
                                              builder: (ctx) {
                                                return Container(
                                                  padding: EdgeInsets.only(
                                                      top: 16,
                                                      right: 8,
                                                      left: 8.0),
                                                  child: Flex(
                                                    direction: Axis.vertical,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                          child:
                                                              ListView.builder(
                                                                  shrinkWrap:
                                                                      true,
                                                                  itemCount: (jsonResponse["statements"] as List).length,
                                                                  itemBuilder:
                                                                      (_ctx,
                                                                          index) {
                                                                    return Container(
                                                                        padding: EdgeInsets.symmetric(
                                                                            vertical:
                                                                                12.0,
                                                                            horizontal:
                                                                                0.0),
                                                                        child:
                                                                            ListTile(
                                                                          onTap:
                                                                              () async {
                                                                                final bool _canLaunch = await canLaunch("$apiUrl/console/505287/api/statements/${jsonResponse["statements"][index]["id"]}/print/");
                                                                                if (_canLaunch) {
                                                                                  await launch("$apiUrl/console/505287/api/statements/${jsonResponse["statements"][index]["id"]}/print/");
                                                                                }
                                                                              },
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                                                                          contentPadding: EdgeInsets.symmetric(
                                                                              vertical: 12.0,
                                                                              horizontal: 8.0),
                                                                          leading: Container(
                                                                              width: 48.0,
                                                                              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.grey.withOpacity(0.5), width: 0.5)),
                                                                              child: Center(
                                                                                  child: Icon(
                                                                                Feather.download_cloud,
                                                                                color: Colors.red,
                                                                                size: 20.0,
                                                                              ))),
                                                                          title:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: <Widget>[
                                                                              Container(
                                                                                child: Text(
                                                                                  "Statement #${jsonResponse["statements"][index]["id"]}",
                                                                                  //"${state.invoices[index].retailer}",
                                                                                  overflow: TextOverflow.ellipsis,
                                                                                  style: TextStyle(fontSize: 15.0),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                margin: EdgeInsets.only(top: 6.0),
                                                                                child: RichText(
                                                                                  text: TextSpan(children: [
                                                                                    TextSpan(text: "${jsonResponse["statements"][index]["due"]}", style: TextStyle(color: Colors.grey, fontSize: 12.0, fontWeight: FontWeight.w400)),
                                                                                    TextSpan(text: " • ", style: TextStyle(color: Colors.grey, fontSize: 12.0, fontWeight: FontWeight.w500)),
                                                                                    TextSpan(text: "\u20b9${jsonResponse["statements"][index]["balance"]}", style: TextStyle(color: Colors.grey, fontSize: 13.0, fontWeight: FontWeight.w400))
                                                                                  ]),
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ),
                                                                          trailing: Container(
                                                                              child: Text("\u20b9${jsonResponse["statements"][index]["final"]}",
                                                                                  //"\u20b9 ${state.invoices[index].amount.toStringAsFixed(2)}",
                                                                                  style: TextStyle(fontFamily: "Gilroy SemiBold", color: Color(0XFF131B26), fontWeight: FontWeight.w500, fontSize: 18.0))),
                                                                        ));
                                                                  }))
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
                                          labelPadding: EdgeInsets.only(
                                              left: 4, right: 8),
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
                        delegate:
                            SliverHeaderDelegate(tabController: controller),
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
                            itemCount: (jsonResponse["ledger"] as List).length,
                            itemBuilder: (context, index) {
                              return Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 8.0),
                                  child: ListTile(
                                    title: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            "${jsonResponse["ledger"][index]["description"]}",
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
                                                    text: "${jsonResponse["ledger"][index]["date"]}",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                TextSpan(
                                                    text: " • ",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                TextSpan(
                                                    text: "\u20b9${jsonResponse["ledger"][index]["closing_balance"]}",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 13.0,
                                                        fontWeight:
                                                            FontWeight.w400))
                                              ]),
                                            ))
                                      ],
                                    ),
                                    trailing: Container(
                                        child: Text(
                                          "\u20b9${jsonResponse["ledger"][index]["amount"]}",
                                            style: TextStyle(
                                                fontFamily: "Gilroy Regular",
                                                color: double.parse('${jsonResponse["ledger"][index]["amount"]}') > 0 ? Color(0xff067d68) : dangerColor,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16.0))),
                                  ));
                            },
                          ),
                        ),
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
          )
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
