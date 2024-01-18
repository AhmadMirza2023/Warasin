import 'package:flutter/material.dart';
import 'package:warasin/theme.dart';

class ScheduleKonselor extends StatefulWidget {
  final bool isActive;
  final int date;
  final String month;
  final VoidCallback onTap;
  final bool isToday;
  ScheduleKonselor({
    required this.isActive,
    required this.date,
    required this.month,
    required this.onTap,
    required this.isToday,
  });

  @override
  State<ScheduleKonselor> createState() => _ScheduleKonselorState();
}

class _ScheduleKonselorState extends State<ScheduleKonselor> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.only(right: 14),
        height: 76,
        width: 76,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.isActive
              ? primaryColor
              : (widget.isToday ? primaryColor : Color(0XFFF3F3F3)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.date.toString(),
                style: widget.isActive
                    ? quarterTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semiBold,
                      )
                    : primaryTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semiBold,
                      )),
            Text(
              widget.month,
              style: widget.isActive
                  ? quarterTextStyle.copyWith(
                      fontSize: 17,
                      fontWeight: medium,
                    )
                  : primaryTextStyle.copyWith(
                      fontSize: 17,
                      fontWeight: medium,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
