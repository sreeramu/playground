import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Staggered Image Grid',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
          key: scaffoldKey,
          appBar: AppBar(title: const Text('TimeLine')),
          body: Center(
            child: Column(children: <Widget>[
              RaisedButton(
                onPressed: () {
                  showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return GestureDetector(
                            onTap: () {
                              scaffoldKey.currentState.showSnackBar(
                                  new SnackBar(
                                      content:
                                          new Text("You pressed Image No")));
                            },
                            child: Container(
                                child: Padding(
                                    padding: const EdgeInsets.all(32.0),
                                    child: Text(
                                        'This is the modal bottom sheet. Tap anywhere to dismiss.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).accentColor,
                                            fontSize: 24.0)))));
                      });
                },
                textColor: Colors.white,
                color: Colors.red,
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                  "Open-1",
                ),
              ),
              RaisedButton(
                onPressed: () {},
                textColor: Colors.white,
                color: Colors.red,
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                  "Open-2",
                ),
              )
            ]),
          )),
    );
  }
}
