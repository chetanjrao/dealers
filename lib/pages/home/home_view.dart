import 'package:dealers/api/client.dart';
import 'package:dealers/components/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'dart:convert';
import 'package:dealers/api/client.dart';
import 'package:dealers/api/constants.dart';
import 'package:dealers/components/colors.dart';
import 'package:dealers/components/components.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatefulWidget {

  final String code;

  const HomeView({Key key, @required this.code}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  bool isLoading = true;
  dynamic jsonResponse;
  List<DropdownMenuItem<dynamic>> stocks = [];
  dynamic fuel;
  final GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
  final APIClient apiClient = new APIClient();

  void getData() async {
    setState(() {
      isLoading = true;
    });
    Response response = await apiClient.getData(widget.code);
    dynamic _jsonReponse = jsonDecode(response.body);
    setState(() {
      jsonResponse = _jsonReponse;
      isLoading = false;
      for (var stock in _jsonReponse["stocks"]) {
        stocks.add(DropdownMenuItem<dynamic>(
          value: stock["id"],
          child: new Text('${stock["name"]}'),
        ));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                                    BorderRadius.circular(12.0),
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
                    })) : CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 2,
              forceElevated: true,
              pinned: true,
              backgroundColor: Colors.white,
              expandedHeight: 120,
              toolbarHeight: 64.0,
              leading: BackButton(
                color: Colors.black,
              ),
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                title: Text(
                  "Welcome, ${jsonResponse["name"]}",
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      fontFamily: primaryFont,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ),
              actions: [
                // Container(
                //   margin: const EdgeInsets.symmetric(horizontal: 16.0),
                //   child: CircleAvatar(
                //     backgroundColor: Colors.black,
                //     radius: 16,
                //     child: ClipOval(
                //       child: Image.network(
                //         'https://outrider.live/assets/img/Chetan.jpg',
                //         width: 32,
                //         height: 32,
                //         fit: BoxFit.cover,
                //       ),
                //     ),                  ),
                // )
              ],
            ),
            const SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 8.0)),
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 6.0),
                                  child: const Icon(
                                    Boxicons.bxs_flame,
                                    color: Color(0xFF37CF76),
                                    size: 28.0,
                                  )),
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 6.0),
                                  child: Text(
                                    "\u20b9${jsonResponse["fuel_sales"]}",
                                    style: TextStyle(
                                        fontSize: 19.0,
                                        fontFamily: primaryFont,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 6.0),
                                  child: const Text(
                                    "Fuel sales",
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: primaryFont,
                                        fontWeight: FontWeight.w400),
                                  ))
                            ],
                          )),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(4.0),
                    child: Card(
                      elevation: 0,
                      color: const Color(0xFFE3EDFF),
                      shape: const RoundedRectangleBorder(),
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 6.0),
                                  child: const Icon(
                                    Boxicons.bxs_store,
                                    color: Color(0xFF297BFF),
                                    size: 28.0,
                                  )),
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 6.0),
                                  child: Text(
                                    "\u20b9${jsonResponse["lube_sales"]}",
                                    style: TextStyle(
                                        fontSize: 19.0,
                                        fontFamily: primaryFont,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 6.0),
                                  child: const Text(
                                    "Lube sales",
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: primaryFont,
                                        fontWeight: FontWeight.w400),
                                  ))
                            ],
                          )),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(4.0),
                    child: Card(
                      elevation: 0,
                      color: const Color(0xFFFFEAE9),
                      shape: const RoundedRectangleBorder(),
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 6.0),
                                  child: const Icon(
                                    Boxicons.bx_rupee,
                                    color: Color(0xFFFF5238),
                                    size: 28.0,
                                  )),
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 6.0),
                                  child: Text(
                                    "\u20b9${jsonResponse["expenses"]}",
                                    style: TextStyle(
                                        fontSize: 19.0,
                                        fontFamily: primaryFont,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 6.0),
                                  child: const Text(
                                    "Expenses",
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: primaryFont,
                                        fontWeight: FontWeight.w400),
                                  ))
                            ],
                          )),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(4.0),
                    child: Card(
                      elevation: 0,
                      color: const Color(0xFFEDE4FF),
                      shape: const RoundedRectangleBorder(),
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 6.0),
                                  child: const Icon(
                                    Boxicons.bx_credit_card,
                                    color: Color(0xFF5F11D7),
                                    size: 28.0,
                                  )),
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 6.0),
                                  child: Text(
                                    "\u20b9${jsonResponse["total"]}",
                                    style: TextStyle(
                                        fontSize: 19.0,
                                        fontFamily: primaryFont,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 6.0),
                                  child: const Text(
                                    "Total Sales",
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: primaryFont,
                                        fontWeight: FontWeight.w400),
                                  ))
                            ],
                          )),
                    ),
                  )
                ],
              ),
            ),
            SliverPadding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            SliverToBoxAdapter(
              child: ListTile(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (ctx) {
                      return StatefulBuilder(builder: (ct, onModalState) {
                        return AlertDialog(
                          title: Text('Choose Fuel'),
                          content: new DropdownButton<dynamic>(
                            value: fuel,
                            isDense: true,
                            isExpanded: true,
                            hint: Text("Choose fuel"),
                            items: stocks,
                            onChanged: (v) {
                              setState(() {
                                fuel = v;
                              });
                              onModalState(() {
                                fuel = v;
                              });
                            },
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text('View DSR'),
                              onPressed: () async {
                                DateTime now = DateTime.now();
                                DateTime firstday =
                                    DateTime(now.year, now.month, 1);
                                DateTime lastday =
                                    DateTime(now.year, now.month + 1, 0);
                                var formatter = DateFormat('yyyy-MM-dd');
                                if (fuel != null) {
                                  final bool _canLaunch = await canLaunch(
                                      "$apiUrl/console/${widget.code}/reports/api/dip-report/print/?from=${formatter.format(firstday)}&to=${formatter.format(lastday)}&fuel=$fuel");
                                  if (_canLaunch) {
                                    await launch("$apiUrl/console/${widget.code}/reports/api/dip-report/print/?from=${formatter.format(firstday)}&to=${formatter.format(lastday)}&fuel=$fuel");
                                  }
                                }
                              },
                            ),
                          ],
                        );
                      });
                    },
                  );
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 24.0),
                leading: Icon(
                  Boxicons.bx_calendar,
                  color: Colors.black,
                ),
                trailing: Icon(
                  Boxicons.bx_chevron_right,
                  color: Colors.black,
                ),
                title: Text(
                  "View Monthly DSR",
                  style: TextStyle(fontFamily: "Gilroy Semibold"),
                ),
              ),
            ),
            SliverPadding(padding: EdgeInsets.symmetric(vertical: 6.0)),
            SliverToBoxAdapter(
              child: ListTile(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (ctx) {
                      return StatefulBuilder(builder: (ct, onModalState) {
                        return AlertDialog(
                          title: Text('Choose Fuel'),
                          content: new DropdownButton<dynamic>(
                            value: fuel,
                            isDense: true,
                            isExpanded: true,
                            hint: Text("Choose fuel"),
                            items: stocks,
                            onChanged: (v) {
                              setState(() {
                                fuel = v;
                              });
                              onModalState(() {
                                fuel = v;
                              });
                            },
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text('View Daily Report'),
                              onPressed: () async {
                                DateTime now = DateTime.now();
                                var formatter = DateFormat('yyyy-MM-dd');
                                if (fuel != null) {
                                  final bool _canLaunch = await canLaunch(
                                      "$apiUrl/console/${widget.code}/reports/api/dsr/print/?date=${formatter.format(now)}&fuel=$fuel");
                                  if (_canLaunch) {
                                    await launch("$apiUrl/console/${widget.code}/reports/api/dsr/print/?date=${formatter.format(now)}&fuel=$fuel");
                                  }
                                }
                              },
                            ),
                          ],
                        );
                      });
                    },
                  );
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 24.0),
                leading: Icon(
                  Boxicons.bx_notepad,
                  color: Colors.black,
                ),
                trailing: Icon(
                  Boxicons.bx_chevron_right,
                  color: Colors.black,
                ),
                title: Text(
                  "View Daily Summary Report",
                  style: TextStyle(fontFamily: "Gilroy Semibold"),
                ),
              ),
            )
          ],
        ),
    );
  }
}