import 'package:flutter/material.dart';

void main() => runApp(AddCustomerApp());

class AddCustomerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Customer',
      home: AddCustomerForm(),
    );
  }
}

class AddCustomerForm extends StatefulWidget {
  @override
  _AddCustomerFormState createState() => _AddCustomerFormState();
}

class _AddCustomerFormState extends State<AddCustomerForm> {
  List<DayData> days = List<DayData>();

  @override
  void initState() {
    super.initState();
    var today = new DateTime.now();
    var oneDayDuration = Duration(days: 1);
    var fiftyDaysFromNow = today.add(new Duration(days: 50));
    while (today != fiftyDaysFromNow) {
      days.add(DayData(today.day.toString(), false, today.weekday));
      today = today.add(oneDayDuration);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer'),
      ),
      backgroundColor: Colors.grey,
      body: Center(
          child: Container(
        height: 50.0,
        child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: getListWidget()),
      )),
    );
  }

  List<Widget> getListWidget() {
    List<Widget> widgetList = List<Widget>();
    days.forEach((f) {
      widgetList.add(Container(
          width: 50.0,
          height: 50.0,
          margin: EdgeInsets.only(right: 5.0),
          color: Colors.white,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                f.dayWord,
                style: TextStyle(color: Colors.black),
              ),
              Text(
                f.dayNumber,
                style: TextStyle(color: Colors.black),
              )
            ],
          )));
    });
    return widgetList;
  }
}

class DayData {
  final String dayNumber;
  String dayWord;
  final bool isMonthStart;

  DayData(this.dayNumber, this.isMonthStart, int weekDayNum) {
    dayWord = getDayWord(weekDayNum);
  }

  String getDayWord(int weekday) {
    switch (weekday) {
      case 1:
        return "Mon";
      case 2:
        return "Tue";
      case 3:
        return "Wed";
      case 4:
        return "Thu";
      case 5:
        return "Fri";
      case 6:
        return "Sat";
      case 7:
        return "Sun";
      default:
        return "";
    }
  }
}
