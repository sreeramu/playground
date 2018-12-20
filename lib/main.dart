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
  List<String> days = List<String>();

  @override
  void initState() {
    super.initState();
    var today = new DateTime.now();
    var oneDayDuration = Duration(days: 1);
    var fiftyDaysFromNow = today.add(new Duration(days: 50));
    while (today != fiftyDaysFromNow) {
      days.add(today.day.toString());
      today = today.add(oneDayDuration);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer'),
      ),
      body: Center(
        child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: getListWidget()),
      ),
    );
  }

  List<Widget> getListWidget() {
    List<Widget> widgetList = List<Widget>();
    days.forEach((f) {
      widgetList.add(Container(
        width: 160.0,
        height: 50.0,
        color: Colors.red,
        alignment: Alignment.center,
        child: Text(
          f,
          style: TextStyle(color: Colors.white),
        ),
      ));
    });
    return widgetList;
  }
}
