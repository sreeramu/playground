import 'package:flutter/material.dart';
import 'package:playground/sticky_date_list.dart';
import 'dart:math';

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

class _AddCustomerFormState extends State<AddCustomerForm> with SingleTickerProviderStateMixin{
  double _fraction = 0.0;
  Animation<double> animation;
 
  @override
  void initState() {
    super.initState();
    var controller = AnimationController(
        duration: Duration(milliseconds: 30000), vsync: this);
 
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          _fraction = animation.value;
        });
      });
 
    controller.forward();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Customer'),
      ),
      backgroundColor: Colors.grey,
      body: Center(
            child: AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                    padding: EdgeInsets.all(32.0),
                    child: CustomPaint(painter: CirclePainter(_fraction))))),
    );
  }
}

class CirclePainter extends CustomPainter {
  Paint _paint;
  double _fraction;
 
  CirclePainter(this._fraction) {
    _paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke;
  }
 
  @override
  void paint(Canvas canvas, Size size) {
    print('paint $_fraction');
 
    var rect = Offset(0.0, 0.0) & size;
 
    canvas.drawArc(rect, -pi / 2, pi * 2 * _fraction, false, _paint);
  }
 
  @override
  bool shouldRepaint(CirclePainter oldDelegate) {
    return oldDelegate._fraction != _fraction;
  }
}
