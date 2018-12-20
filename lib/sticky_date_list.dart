import 'package:flutter/material.dart';

class StickyDateList extends StatefulWidget {
  @override
  _StickyDateListState createState() => _StickyDateListState();
}

class _StickyDateListState extends State<StickyDateList> {
  List<DayData> days = List<DayData>();
  ScrollController controller;
  String cMonth;
  var _stickyTranslationOffset = 0.0;

  @override
  void initState() {
    super.initState();
    controller = new ScrollController();
    controller.addListener(() {
      var pixels = controller.offset;
      var positionElement = _getPositionForOffset(context, pixels);
      if (cMonth != positionElement[0].monthWord) {
        setState(() {
          cMonth = positionElement[0].monthWord;
        });
      }

      if (positionElement[1].isMonthStart) {
        setState(() {
          _stickyTranslationOffset = (positionElement[2] * -1.0);
        });
      } else {
        if (_stickyTranslationOffset < 0.0) {
          setState(() {
            _stickyTranslationOffset = 0.0;
          });
        }
      }
    });
    var today = new DateTime.now();
    var oneDayDuration = Duration(days: 1);
    var fiftyDaysFromNow = today.add(new Duration(days: 120));
    int preMonth;
    days.add(DayData(today.day.toString(), true, today.weekday, today.month));
    cMonth = days[0].monthWord;
    while (today != fiftyDaysFromNow) {
      days.add(
          DayData(today.day.toString(), false, today.weekday, today.month));
      preMonth = today.month;
      today = today.add(oneDayDuration);
      if (preMonth != today.month && today != fiftyDaysFromNow) {
        days.add(
            DayData(today.day.toString(), true, today.weekday, today.month));
      }
    }
  }

  List<dynamic> _getPositionForOffset(BuildContext ctx, double offset) {
    double calcOffset = offset;
    int counter;

    if (offset < 1) {
      return null;
    }
    DayData f;
    for (int i = 0; i < days.length; i++) {
      f = days[i];
      if (f.isMonthStart) {
        calcOffset -= 20;
      } else {
        calcOffset -= 60.5;
      }
      counter = i;
      if (calcOffset <= 0) {
        break;
      }
    }

    DayData e = f;
    calcOffset += 20;
    if (calcOffset >= 0) {
      e = days[counter + 1];
    }
    return [f, e, calcOffset];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: Stack(children: <Widget>[
        new Container(
          decoration: new BoxDecoration(color: Colors.white.withOpacity(0.5)),
        ),
        ListView.builder(
            controller: controller,
            itemCount: days.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ListItem(
                days[index],
              );
            }),
        new Positioned(
          child: _getStickyHeaderWidget(cMonth),
          top: 0.0,
          bottom: 0.0,
          left: 0.0,
          right: null,
        )
      ]),
    );
  }

  Widget _getStickyHeaderWidget(String data) {
    return Container(
        width: 20.0,
        height: 60.0,
        transform:
            new Matrix4.translationValues(_stickyTranslationOffset, 0.0, 0.0),
        margin: EdgeInsets.only(right: 1.0),
        color: Colors.green,
        alignment: Alignment.center,
        child: RotatedBox(
            quarterTurns: 3,
            child: new Text(
              data,
              style: TextStyle(color: Colors.white),
            )));
  }
}

class DayData {
  final String dayNumber;
  String dayWord;
  final bool isMonthStart;
  String monthWord;

  DayData(this.dayNumber, this.isMonthStart, int weekDayNum, int month) {
    dayWord = getDayWord(weekDayNum);
    monthWord = getMonthWord(month);
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

  String getMonthWord(int inputMonth) {
    String month;
    switch (inputMonth) {
      case 1:
        month = "JAN";
        break;
      case 2:
        month = "FEB";
        break;
      case 3:
        month = "MAR";
        break;
      case 4:
        month = "APR";
        break;
      case 5:
        month = "MAY";
        break;
      case 6:
        month = "JUN";
        break;
      case 7:
        month = "JUL";
        break;
      case 8:
        month = "AUG";
        break;
      case 9:
        month = "SEP";
        break;
      case 10:
        month = "OCT";
        break;
      case 11:
        month = "NOV";
        break;
      case 12:
        month = "DEC";
        break;
    }
    return month;
  }
}

class ListItem extends StatelessWidget {
  final DayData data;
  bool isSticky;

  ListItem(this.data) {
    isSticky = data.isMonthStart;
  }

  @override
  Widget build(BuildContext context) {
    if (!data.isMonthStart) {
      return Container(
          width: 60.0,
          height: 50.0,
          margin: EdgeInsets.only(right: 0.5),
          color: Color(0xFF008CFF),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                data.dayWord,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                data.dayNumber,
                style: TextStyle(color: Colors.white),
              )
            ],
          ));
    } else {
      return Container(
          width: 20.0,
          height: 60.0,
          //margin: EdgeInsets.only(right: 0.5),
          color: Colors.green,
          alignment: Alignment.center,
          child: RotatedBox(
              quarterTurns: 3,
              child: new Text(
                data.monthWord,
                style: TextStyle(color: Colors.white),
              )));
    }
  }
}
