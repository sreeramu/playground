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
    int preMonth;
    while (today != fiftyDaysFromNow) {
      days.add(DayData(today.day.toString(), false, today.weekday));
      preMonth = today.month;
      today = today.add(oneDayDuration);
      if (preMonth != today.month && today != fiftyDaysFromNow) {
        days.add(DayData(today.day.toString(), true, today.weekday));
      }
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
            scrollDirection: Axis.horizontal,
            children: getListWidget()),
      )),
    );
  }

  List<Widget> getListWidget() {
    List<Widget> widgetList = List<Widget>();
    days.forEach((f) {
      widgetList.add(getListItem(f));
    });
    return widgetList;
  }

  Widget getListItem(DayData data) {
    if (!data.isMonthStart) {
      return Container(
          width: 60.0,
          height: 50.0,
          margin: EdgeInsets.only(right: 1.0),
          color: Colors.white,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                data.dayWord,
                style: TextStyle(color: Colors.black),
              ),
              Text(
                data.dayNumber,
                style: TextStyle(color: Colors.black),
              )
            ],
          ));
    } else {
      return Container(
          width: 20.0,
          height: 60.0,
          margin: EdgeInsets.only(right: 1.0),
          color: Colors.green,
          alignment: Alignment.center,
          child: new RotatedBox(
              quarterTurns: 1,
              child: new Text(
                data.dayWord,
                style: TextStyle(color: Colors.white),
              )));
    }
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
