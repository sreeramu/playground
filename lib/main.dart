import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final lastnameController = TextEditingController();
  final firstnameController = TextEditingController();
  final miController = TextEditingController();
  final addressController = TextEditingController();
  final dobController = TextEditingController();

  @override
  void dispose() {
    lastnameController.dispose();
    firstnameController.dispose();
    miController.dispose();
    addressController.dispose();
    dobController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Customer'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new TextFormField(
              controller: lastnameController,
              obscureText: true,
              decoration: new InputDecoration(
                  labelText: 'Lastname',
                  suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        lastnameController.clear();
                      })),
              inputFormatters: [new LengthLimitingTextInputFormatter(32)],
            ),
            new TextFormField(
              controller: firstnameController,
              obscureText: true,
              decoration: new InputDecoration(
                  labelText: 'Firstname',
                  suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        firstnameController.clear();
                      })),
              inputFormatters: [new LengthLimitingTextInputFormatter(32)],
            ),
            new Container(
              width: 50.0,
              child: new TextFormField(
                controller: miController,
                decoration: new InputDecoration(labelText: 'MI'),
                inputFormatters: [new LengthLimitingTextInputFormatter(1)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
