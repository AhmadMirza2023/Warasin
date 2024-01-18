import 'package:flutter/material.dart';
import 'package:warasin/theme.dart';

class KonselorFavCard extends StatefulWidget {
  final int konselorId;
  final String imageKonselor;
  final String nameKonselor;
  final String hospitalKonselor;

  KonselorFavCard({
    required this.konselorId,
    required this.imageKonselor,
    required this.nameKonselor,
    required this.hospitalKonselor,
  });

  @override
  State<KonselorFavCard> createState() => _KonselorFavCardState();
}

class _KonselorFavCardState extends State<KonselorFavCard> {
  bool isFavorite = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Konselor ID: ${widget.konselorId}');
        Navigator.pushNamed(
          context,
          '/detail-konselor',
          arguments: {'konselorId': widget.konselorId},
        );
      },
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: backgroundColorWhite,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    widget.imageKonselor,
                    fit: BoxFit.cover,
                    height: 150,
                    width: 250,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: backgroundColorWhite,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(isFavorite
                            ? 'assets/icon_fav_active.png'
                            : 'assets/icon_fav.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.nameKonselor,
                        style: primaryTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: semiBold,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow[800],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '4.9',
                            style: primaryTextStyle.copyWith(
                              fontSize: 15,
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Rumah Sakit ${widget.hospitalKonselor}',
                    style: tertiaryTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: regular,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
