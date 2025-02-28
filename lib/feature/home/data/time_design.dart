import 'dart:async';
import 'package:flutter/material.dart';

class TimeDesign extends StatefulWidget {
  const TimeDesign({super.key});

  @override
  State<TimeDesign> createState() => _TimeDesignState();
}

class _TimeDesignState extends State<TimeDesign> {
  late Timer _timer;
  DateTime _currentTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() => _currentTime = DateTime.now());
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _timeBox(_currentTime.hour),
        Text(":", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        _timeBox(_currentTime.minute),
        Text(":", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        _timeBox(_currentTime.second),
      ],
    );
  }

  Widget _timeBox(int value) => Container(
    margin: EdgeInsets.all(2),
    padding: EdgeInsets.symmetric(vertical: 1, horizontal: 4),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      color: Colors.grey[300],
    ),
    child: Text(
      value.toString().padLeft(2, '0'),
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    ),
  );

}
