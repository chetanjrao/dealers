import 'dart:convert';

import 'package:dealers/api/client.dart';
import 'package:dealers/components/fonts.dart';
import 'package:dealers/pages/customers/ui/c_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:http/http.dart';
import 'package:shimmer/shimmer.dart';

class Customers extends StatefulWidget {
  final String code;

  const Customers({Key key, @required this.code}) : super(key: key);

  @override
  _CustomersState createState() => _CustomersState();
}

class Customer {
  final dynamic id;
  final dynamic name;
  final dynamic balance;
  final dynamic limit;
  final dynamic mobile;

  Customer(this.id, this.name, this.balance, this.limit, this.mobile);

  static Customer fromJson(dynamic json) {
    return Customer(json["id"], json["name"], json["balance"], json["limit"],
        json["mobile"]);
  }
}

class _CustomersState extends State<Customers> {
  bool isLoading = true;
  List<Customer> jsonResponse = [];
  int length = 0;
  final GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
  final APIClient apiClient = new APIClient();

  void getData() async {
    setState(() {
      isLoading = true;
    });
    Response response = await apiClient.getCustomers(widget.code);
    List<Customer> _jsonReponse = (json.decode(response.body) as List)
        .map((i) => Customer.fromJson(i))
        .toList();
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
          : CustomScrollView(slivers: [
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
                  titlePadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  title: Text(
                    "Credit Customers",
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                        fontFamily: primaryFont,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
              ),
              SliverPadding(padding: EdgeInsets.symmetric(vertical: 10)),
              SliverList(
                  delegate: SliverChildBuilderDelegate((ctx, index) {
                return GestureDetector(
                  child: Card(
                        margin: EdgeInsets.zero,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: ListTile(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => CustomerProfile(code: widget.code, customer: jsonResponse[index].id) ));
                            },
                            leading: Container(
                              width: 48.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.5),
                                  width: 0.5
                                )
                              ),
                              child: Center(
                                child: Icon(
                                  Feather.user,
                                  color: Colors.red,
                                  size: 20.0,
                                )
                              )
                            ),
                            title: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "${jsonResponse[index].name}",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 15.0
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 6.0),
                                  child: Text(
                                    "Limit: \u20b9${jsonResponse[index].limit}",
                                    style: TextStyle(
                                      color: Color(0XFF404864),
                                      fontSize: 13.0
                                    ),
                                  ),
                                )
                              ],
                            ),
                            trailing: Container(
                              child: Text(
                                "\u20b9${jsonResponse[index].balance}",
                                style: TextStyle(
                                  color: Color(0XFF131B26),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0
                                )
                              )
                            ),
                          )
                        )));
              }, childCount: jsonResponse.length))
            ]),
    );
  }
}
