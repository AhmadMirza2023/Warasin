import 'package:flutter/material.dart';
import 'package:warasin/theme.dart';

class TimeScheduleKonselor extends StatefulWidget {
  final String time;
  final bool isActive;
  final VoidCallback onTap;
  TimeScheduleKonselor({
    required this.time,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<TimeScheduleKonselor> createState() => _TimeScheduleKonselorState();
}

class _TimeScheduleKonselorState extends State<TimeScheduleKonselor> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        width: 96,
        height: 47,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.isActive ? primaryColor : Color(0XFFF3F3F3),
        ),
        child: Center(
          child: Text(
            widget.time,
            style: widget.isActive
                ? quarterTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: semiBold,
                  )
                : primaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: semiBold,
                  ),
          ),
        ),
      ),
    );
  }
}
