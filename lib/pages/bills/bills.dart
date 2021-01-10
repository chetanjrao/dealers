import 'package:dealers/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;

class Bills extends StatefulWidget {
  @override
  _BillsState createState() => _BillsState();
}

class _BillsState extends State<Bills> {
  DateTime startDate = (new DateTime.now()).subtract(new Duration(days: 7));
  DateTime endDate = (new DateTime.now());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          backgroundColor: Colors.white,
          title: Text(
            "Bills",
            style: TextStyle(
              color: Colors.black
            ),
          ),
          leading: BackButton(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        body: Container(
          margin:EdgeInsets.only(left: 16.0, top: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text("Download Vehicle Bill"),
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Container(
                        child: DropdownButton<String>(
                          items: <String>['KA 36 5EL 4532', 'B', 'C', 'D'].map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          value: "KA 36 5EL 4532",
                          onChanged: (_) {},
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(16.0),
                        child: new FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0)
                          ),
                          color: primaryColor,
                          onPressed: () async {
                            final List<DateTime> picked = await DateRagePicker.showDatePicker(
                              context: context,
                              initialFirstDate: startDate,
                              initialLastDate: endDate,
                              firstDate: new DateTime(2015),
                              lastDate: endDate);
                              if (picked != null && picked.length == 2) {
                                print(picked);
                              }
                          },
                          child: new Text(
                            "Download",
                            style: TextStyle(
                              color: Colors.white
                            ),
                          )
                        )
                      )
                    ],
                  )
                ),
            ],
          ),
        ),
      ),
    );
  }
}