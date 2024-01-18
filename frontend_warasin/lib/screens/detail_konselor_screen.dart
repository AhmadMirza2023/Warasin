import 'package:custom_rich_text/custom_rich_text.dart';
import 'package:custom_rich_text/models/read_more_less_model.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:warasin/Widget/schedule_konselor.dart';
import 'package:warasin/Widget/time_schedule_konselor.dart';
import 'package:warasin/models/konselor_model.dart';
import 'package:warasin/providers/konselor_provider.dart';
import 'package:warasin/theme.dart';

class DetailKonselorScreen extends StatefulWidget {
  @override
  State<DetailKonselorScreen> createState() => _DetailKonselorScreenState();
}

class _DetailKonselorScreenState extends State<DetailKonselorScreen> {
  int? selectedDate;
  String? selectedTime;

  List<String> timeSlots = [
    '10.00 - 11.00',
    '12.00 - 13.00',
    '14.00 - 15.00',
    '16.00 - 17.00',
    '18.00 - 19.00',
    '20.00 - 21.00',
    '22.00 - 23.00',
  ];

  @override
  void initState() {
    super.initState();
    DateTime today = DateTime.now();
    selectedDate = today.day;
  }

  @override
  Widget build(BuildContext context) {
    final konselorProvider = Provider.of<KonselorProvider?>(context);

    if (konselorProvider != null) {
      konselorProvider.getKonselors();
      final Map<String, dynamic> arguments =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      final int konselorId = arguments['konselorId'];
      print('Konselor ID: $konselorId');
      final KonselorModel? konselor =
          konselorProvider.getKonselorById(konselorId);
      print('Konselor: $konselor');
      print('Konselor ID from arguments: $konselorId');
      if (konselor != null) {
        return Scaffold(
          appBar: AppBar(
            leadingWidth: 80,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.chevron_left,
                size: 40,
                color: primaryColor,
              ),
            ),
            title: Text(
              'Detail Konselor',
              style: primaryTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            backgroundColor: backgroundColorWhite,
            toolbarHeight: 100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            bottom: PreferredSize(
              preferredSize: Size(
                MediaQuery.of(context).size.width,
                180,
              ),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: backgroundColorWhite,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  // borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 15,
                      // spreadRadius: 5,
                      color: Colors.blueGrey,
                      offset: Offset(0, 15),
                      // offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 22,
                    ),
                    Container(
                      height: 124,
                      width: 170,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              Uri.encodeFull(konselor.foto),
                              fit: BoxFit.cover,
                              height: 124,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              width: 50,
                              height: 38,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                color: backgroundColorWhite,
                              ),
                              child: Center(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow[700],
                                    ),
                                    Text(
                                      '4.9',
                                      style: primaryTextStyle.copyWith(
                                        fontSize: 13,
                                        fontWeight: regular,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 23,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          konselor.nama,
                          style: primaryTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          'Psikolog - Rs. ${konselor.rumahSakit}',
                          style: primaryTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: regular,
                          ),
                        ),
                        SizedBox(
                          height: 45,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/icon_phone_green.png',
                                width: 34,
                                fit: BoxFit.cover,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/icon_chat_green.png',
                                width: 34,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 34,
                      horizontal: 60,
                    ),
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
                              '${konselor.lamaKerja}+',
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
                    height: 10,
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
                          text: konselor.deskripsi,
                          textStyle: primaryTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium,
                          ),
                          readMoreLessModel: ReadMoreLessModel(
                            trimLines: 2,
                            readMoreText: ' baca selengkapnya...',
                            readLessText: 'sembunyikan...',
                            readMoreLessStyle: logoTextStyleGreen.copyWith(
                              fontSize: 14,
                              fontWeight: medium,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 42),
                    child: Text(
                      'Jadwal',
                      style: primaryTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 76,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Jiffy().endOf(Units.MONTH).date - 16,
                      itemBuilder: (context, index) {
                        int day = index + 17;
                        DateTime today = DateTime.now();
                        DateTime currentDate = DateTime(
                          today.year,
                          today.month,
                          day,
                        );
                        bool isToday = currentDate.isAtSameMomentAs(today);
                        EdgeInsets margin = EdgeInsets.only(
                          left: index == 0 ? 42 : 0,
                          right: index == Jiffy().endOf(Units.MONTH).date - 17
                              ? 15
                              : 0,
                        );
                        return Container(
                          margin: margin,
                          child: ScheduleKonselor(
                            isActive: selectedDate == null
                                ? isToday
                                : selectedDate == day,
                            isToday: isToday,
                            date: day,
                            month: 'Januari',
                            onTap: () {
                              setState(() {
                                selectedDate = day;
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 23,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 42),
                    child: Text(
                      'Waktu',
                      style: primaryTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    height: 47,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: timeSlots.length,
                      itemBuilder: (context, index) {
                        String time = timeSlots[index];
                        EdgeInsets margin = EdgeInsets.only(
                          left: index == 0 ? 42 : 0,
                          right: index == timeSlots.length - 1 ? 15 : 0,
                        );
                        return Container(
                          margin: margin,
                          child: TimeScheduleKonselor(
                            time: time,
                            isActive: selectedTime == time,
                            onTap: () {
                              setState(
                                () {
                                  selectedTime = time;
                                },
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Center(
                    child: TextButton(
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 50,
                          ),
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      onPressed: () {
                        if (selectedDate == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: dangerColor,
                              duration: Duration(
                                milliseconds: 1750,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              showCloseIcon: true,
                              dismissDirection: DismissDirection.none,
                              content: Center(
                                child: Text(
                                  'Harap memilih jadwal!',
                                  style: secondaryTextStyle.copyWith(
                                    fontSize: 17,
                                    fontWeight: medium,
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else if (selectedTime == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: dangerColor,
                              duration: Duration(
                                milliseconds: 1750,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              showCloseIcon: true,
                              dismissDirection: DismissDirection.none,
                              content: Center(
                                child: Text(
                                  'Harap memilih waktu!',
                                  style: secondaryTextStyle.copyWith(
                                    fontSize: 17,
                                    fontWeight: medium,
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: successColor,
                              duration: Duration(
                                milliseconds: 1750,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              showCloseIcon: true,
                              dismissDirection: DismissDirection.none,
                              content: Center(
                                child: Text(
                                  'Pesanan sudah masuk ke keranjang!',
                                  style: secondaryTextStyle.copyWith(
                                    fontSize: 17,
                                    fontWeight: medium,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Pesan Konselor Sekarang',
                        style: quarterTextStyle.copyWith(
                          fontSize: 15,
                          fontWeight: semiBold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        return Scaffold(
          body: Center(
            child: Text('Konselor tidak ditemukan'),
          ),
        );
      }
    } else {
      return Scaffold(
        body: Center(
          child: Text('Konselor provider tidak ditemukan'),
        ),
      );
    }
  }
}
