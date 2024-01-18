import 'package:flutter/material.dart';
import 'package:warasin/theme.dart';

class TopKonselorCard extends StatefulWidget {
  final int konselorId;
  final String imageKonselor;
  final String nameKonselor;

  final String hospital;

  TopKonselorCard({
    required this.konselorId,
    required this.imageKonselor,
    required this.nameKonselor,
    required this.hospital,
  });

  @override
  State<TopKonselorCard> createState() => _TopKonselorCardState();
}

class _TopKonselorCardState extends State<TopKonselorCard> {
  bool isFavorite = false;
  @override
  void initState() {
    super.initState();
    isFavorite = !isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Tapped on konselorId: ${widget.konselorId}');
        Navigator.pushNamed(
          context,
          '/detail-konselor',
          arguments: {'konselorId': widget.konselorId},
        );
      },
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 125,
            decoration: BoxDecoration(
              color: backgroundColorWhite,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          widget.imageKonselor,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width / 3.5,
                          height: MediaQuery.of(context).size.height,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.nameKonselor,
                                style: primaryTextStyle.copyWith(
                                  fontSize: 20,
                                  fontWeight: semiBold,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Psikolog\nRumah Sakit ${widget.hospital}',
                                style: tertiaryTextStyle.copyWith(
                                  fontSize: 15,
                                  fontWeight: medium,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow[800],
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
                    ],
                  ),
                ),
              ],
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
              child: Padding(
                padding: const EdgeInsets.only(right: 7, top: 3),
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color:
                        isFavorite ? backgroundColorWhite : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: primaryColor,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      isFavorite
                          ? 'assets/icon_fav_active.png'
                          : 'assets/icon_fav.png',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
