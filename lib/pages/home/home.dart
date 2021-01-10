import 'package:dealers/api/client.dart';
import 'package:dealers/components/fonts.dart';
import 'package:dealers/pages/customers/ui/customers.dart';
import 'package:dealers/pages/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

class Home extends StatefulWidget {

  final String code;

  const Home({Key key, @required this.code}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  Widget onTapped(int index) {
    switch (index) {
      case 0:
        return HomeView(
          code: widget.code,
        );
      case 1:
        return Customers(
           code: widget.code
        );
      default:
        return HomeView(code: widget.code,);
    }
  }

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
                currentIndex: selectedIndex,
                onTap: (i) {
                  setState(() {
                    selectedIndex = i;
                  });
                },
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.black.withOpacity(0.24),
                selectedLabelStyle: const TextStyle(
                    fontFamily: primaryFont,
                    fontSize: 12.0,
                    color: Colors.black),
                unselectedLabelStyle: TextStyle(
                    fontFamily: primaryFont,
                    fontSize: 12.0,
                    color: Colors.black.withOpacity(0.24)),
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(
                        Boxicons.bx_home,
                        size: 22.0,
                      ),
                      label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Boxicons.bx_user,
                        size: 22.0,
                      ),
                      label: "Customers")
                ],
              ),
            )),
        body: onTapped(selectedIndex));
  }
}
