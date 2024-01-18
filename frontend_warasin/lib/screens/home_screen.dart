import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:warasin/Widget/progress_card.dart';
import 'package:warasin/models/user_model.dart';
import 'package:warasin/providers/auth_provider.dart';

import 'package:warasin/theme.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> _berita = [
    {
      'image': 'berita1.png',
      'description':
          'Halo GenZ, Seberapa Sehatkah Mentalmu? Ini Cara Mendeteksinya dari Psikolog.',
    },
    {
      'image': 'berita2.png',
      'description': '10 Rekomendasi Musik Klasik yang Cocok untuk Relaksasi',
    },
    {
      'image': 'berita3.png',
      'description':
          'Introvert Susah Bergaul karena "Social Battery" Cepat Habis? Begini Kata Psikolog.',
    }
  ];
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    return Scaffold(
      backgroundColor: backgroundColorWhite,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 70,
                  left: 30,
                  bottom: 30,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icon_konselor_fav.png',
                      fit: BoxFit.cover,
                      width: 60,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, ${user.nama}',
                            style: quarterTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: semiBold,
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'Sekarang adalah waktu yang tepat\nuntuk memperbaiki masalahmu!',
                            style: quarterTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: regular,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/order-konselor');
                        },
                        icon: Icon(
                          Icons.shopping_bag_outlined,
                          size: 30,
                          color: backgroundColorWhite,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 243, 243, 243),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 18),
                            width: 60,
                            height: 10,
                            decoration: BoxDecoration(
                              color: primaryTextColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Yang lagi rame nih...',
                                style: primaryTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: semiBold,
                                ),
                              ),
                              Text(
                                'See all',
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: medium,
                                  color: successColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 175,
                          child: CarouselSlider(
                            items: _berita.map(
                              (item) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            spreadRadius: 0.5,
                                            blurRadius: 7,
                                            offset: Offset(4, 4),
                                          ),
                                        ],
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
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  child: Image.asset(
                                                    'assets/${item['image']}',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  width: 150,
                                                  child: Text(
                                                    item['description'],
                                                    style: primaryTextStyle
                                                        .copyWith(
                                                      fontSize: 12,
                                                      fontWeight: medium,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ).toList(),
                            options: CarouselOptions(
                              height: 134,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.75,
                              enlargeCenterPage: true,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            '“Penyakit kamu bukanlah identitasmu.\nChemistry bukanlah karaktermu.”\n−Rick Warren.',
                            style: primaryTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: medium,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Pantau progressmu yuk!!',
                                style: primaryTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: semiBold,
                                ),
                              ),
                              Text(
                                'See all',
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: medium,
                                  color: successColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                ProgressCard(
                                  image: 'assets/icon10.png',
                                  amount: 10,
                                  title: 'Jumlah Komunikasi Dengan A.I',
                                  subTitle: 'Sepertinya anda senang bercerita',
                                  backgroundColor: backgroundColorBlue,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                ProgressCard(
                                  image: 'assets/icon5.png',
                                  amount: 5,
                                  title: 'Konsultasi Dengan Para Ahli',
                                  backgroundColor: Color(0X8033080C),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                ProgressCard(
                                  image: 'assets/icon3.png',
                                  amount: 3,
                                  title: 'Modul Pembelajaran Yang Dibuka',
                                  backgroundColor: Colors.pink.shade400,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0XFFEC993D),
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
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Konselor Favoritmu Bulan Ini!!',
                                        style: quarterTextStyle.copyWith(
                                          fontSize: 15,
                                          fontWeight: semiBold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Center(
                                        child: Image.asset(
                                          'assets/icon_konselor_fav.png',
                                          width: 60,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Center(
                                        child: Text(
                                          'Dr. Discordus',
                                          style: quarterTextStyle.copyWith(
                                            fontSize: 15,
                                            fontWeight: medium,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
