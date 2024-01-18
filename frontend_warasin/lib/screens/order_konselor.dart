import 'package:custom_rich_text/custom_rich_text.dart';
import 'package:custom_rich_text/models/read_more_less_model.dart';
import 'package:flutter/material.dart';
import 'package:warasin/theme.dart';

class OrderKonselor extends StatelessWidget {
  const OrderKonselor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorWhite,
      appBar: AppBar(
        backgroundColor: backgroundColorWhite,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.chevron_left,
            size: 40,
          ),
        ),
        title: Text(
          'Pesanan Saya',
          style: primaryTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - (2 * 40),
                decoration: BoxDecoration(
                  color: backgroundColorWhite,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: backgroundColorGrey,
                      blurRadius: 7,
                      spreadRadius: 1,
                      offset: Offset(5, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image.asset(
                        'assets/image_doctor2.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Dr. Adolfus Brustisus',
                                style: primaryTextStyle.copyWith(
                                  fontSize: 16,
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
                                    width: 7,
                                  ),
                                  Text(
                                    '4.9',
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 15,
                                      fontWeight: regular,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            'Psikolog | Rs. Soetomo',
                            style: primaryTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: regular,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 27,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 62),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/icon_pasien.png',
                        width: 43,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '328+',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        'Pasien',
                        style: primaryTextStyle.copyWith(
                          fontSize: 13,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 44,
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/icon_tahun_kerja.png',
                        width: 43,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '8+',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        'Tahun\nKerja',
                        style: primaryTextStyle.copyWith(
                          fontSize: 13,
                          fontWeight: medium,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 44,
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/icon_star.png',
                        width: 43,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '4.9',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        'Rating',
                        style: primaryTextStyle.copyWith(
                          fontSize: 13,
                          fontWeight: medium,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 44,
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/icon_chat.png',
                        width: 43,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '300+',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        'Ulasan',
                        style: primaryTextStyle.copyWith(
                          fontSize: 13,
                          fontWeight: medium,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tentang Konselor',
                    style: primaryTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  CustomRichText(
                    text:
                        'Saya seorang dokter berpengalaman dengan pengalaman praktik lebih dari 8 tahun. Saya memiliki reputasi yang kuat Saya seorang dokter berpengalaman dengan pengalaman praktik lebih dari 8 tahun. Saya memiliki reputasi yang kuat Saya seorang dokter berpengalaman dengan pengalaman praktik lebih dari 8 tahun. Saya memiliki reputasi yang kuat ',
                    textStyle: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                    readMoreLessModel: ReadMoreLessModel(
                      trimLines: 3,
                      readMoreText: ' baca selengkapnya...',
                      readLessText: 'sembunyikan...',
                      readMoreLessStyle: logoTextStyleGreen.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    'Informasi Pasien',
                    style: primaryTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Nama Lengkap: Budi Setiawan',
                    style: primaryTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    'Gender: Laki-laki',
                    style: primaryTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    'Umur: 20 tahun',
                    style: primaryTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 30,
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
