import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'PlayGround'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(child: LogoWidget()),
    );
  }
}

final Path quadPath = new Path()
  ..moveTo(123.0, 12.2)
  ..relativeLineTo(1.1, -0.2)
  ..relativeCubicTo(4.2, -0.6, 12.1, 1.3, 3.2, 3.1)
  // etc all the way around
  ..close();

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      width: 350.0,
      height: 240.0,
      child: new CustomPaint(
        painter: new LogoPainter(),
      ),
    );
  }
}

class LogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.blue
      ..strokeWidth = 0.0;

    canvas.drawPath(quadPath, paint);

    paint.color = Colors.blue[600];
    canvas.drawCircle(new Offset(123.4, 56.7), 12.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
