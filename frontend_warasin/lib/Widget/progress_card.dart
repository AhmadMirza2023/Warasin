import 'package:flutter/material.dart';
import 'package:warasin/theme.dart';

class ProgressCard extends StatelessWidget {
  final String image;
  final int amount;
  final String title;
  final String subTitle;
  final Color backgroundColor;
  ProgressCard({
    required this.image,
    required this.amount,
    required this.title,
    this.subTitle = '',
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 7,
            offset: Offset(3, 5),
            spreadRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(15),
      width: 185,
      height: 215,
      child: Stack(
        children: [
          Align(
            alignment: Alignment(12, -1.3),
            child: Opacity(
              opacity: 0.5,
              child: Image.asset(
                image,
                width: 152,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '$amount',
                    style: quarterTextStyle.copyWith(
                      fontSize: 30,
                      fontWeight: semiBold,
                      color: backgroundColorWhite,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 11),
                    child: Text(
                      ' x bulan ini',
                      style: quarterTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 11,
              ),
              Text(
                title,
                style: quarterTextStyle.copyWith(
                  fontSize: 17,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                subTitle,
                style: quarterTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: regular,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
