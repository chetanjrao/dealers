import 'dart:convert';

import 'package:dealers/api/client.dart';
import 'package:dealers/components/fonts.dart';
import 'package:dealers/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:http/http.dart';
import 'package:shimmer/shimmer.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  bool isLoading = true;
  dynamic jsonResponse;
  final GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
  final APIClient apiClient = new APIClient();

  void getData() async {
    setState(() {
      isLoading = true;
    });
    Response response = await apiClient.getProfile();
    dynamic _jsonReponse = jsonDecode(response.body);
    setState(() {
      jsonResponse = _jsonReponse;
      isLoading = false;
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
                  }))
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                  margin: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Image.asset(
                    "assets/logo-small.png",
                    width: 48.0,
                    height: 48.0,
                  ),
                ),
                  Text(
                    "Hi,\n ${jsonResponse["name"]}",
                    overflow: TextOverflow.fade,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: primaryFont,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 24.0),
                    child: Text(
                      "Choose fuelstation to monitor",
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: primaryFont,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: (jsonResponse["stations"] as List).length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 24.0),
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (ctx) => Home(
                                    code: "${jsonResponse["stations"][index]["code"]}",
                                  )));
                            },
                            trailing: Icon(Boxicons.bx_chevron_right),
                            title: Text(
                              "${jsonResponse["stations"][index]["name"]}",
                              style: TextStyle(fontFamily: "Gilroy Semibold"),
                            ),
                            subtitle: Text(
                                "${jsonResponse["stations"][index]["provider"]}"),
                          ),
                        );
                      })
                ],
              ),
            ),
    );
  }
}
