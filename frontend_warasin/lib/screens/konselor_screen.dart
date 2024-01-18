import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:warasin/Widget/konselor_fav_card.dart';
import 'package:warasin/Widget/top_konselor_card.dart';
import 'package:warasin/models/konselor_model.dart';
import 'package:warasin/models/user_model.dart';
import 'package:warasin/providers/auth_provider.dart';
import 'package:warasin/providers/konselor_provider.dart';
import 'package:warasin/theme.dart';

class KonselorScreen extends StatefulWidget {
  @override
  State<KonselorScreen> createState() => _KonselorScreenState();
}

class _KonselorScreenState extends State<KonselorScreen> {
  TextEditingController searchController = TextEditingController();
  late List<KonselorModel> filteredList;

  @override
  void initState() {
    super.initState();
    filteredList = [];
    showDefaultList();
  }

  void showDefaultList() {
    KonselorProvider konselorProvider =
        Provider.of<KonselorProvider>(context, listen: false);

    List<KonselorModel> defaultList =
        konselorProvider.konselors.take(5).toList();

    setState(() {
      filteredList = defaultList;
    });
  }

  void filterList(String query) {
    KonselorProvider konselorProvider =
        Provider.of<KonselorProvider>(context, listen: false);

    setState(() {
      if (query.isEmpty) {
        filteredList = konselorProvider.konselors;
      } else {
        filteredList = konselorProvider.konselors
            .where((konselor) =>
                konselor.nama.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    return Scaffold(
      backgroundColor: backgroundColorGrey,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 70,
                  left: 30,
                  bottom: 30,
                ),
                child: Column(
                  children: [
                    Row(
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
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 60,
                      margin: EdgeInsets.only(right: 30),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.transparent,
                      ),
                      child: TextFormField(
                        controller: searchController,
                        onChanged: (query) => filterList(query),
                        style: quarterTextStyle,
                        autocorrect: false,
                        cursorColor: backgroundColorWhite,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: backgroundColorWhite,
                          ),
                          prefixIconColor: primaryTextColor,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: backgroundColorWhite,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: backgroundColorWhite,
                            ),
                          ),
                          hintText: 'Cari Konselor',
                          hintStyle: quarterTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: regular,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height + 800,
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
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 24,
                          left: 30,
                          right: 30,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Konselor Favorit',
                              style: primaryTextStyle.copyWith(
                                fontSize: 20,
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
                      Container(
                        height: 235,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: filteredList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: index == filteredList.length - 1
                                  ? Padding(
                                      padding: EdgeInsets.only(right: 20),
                                      child: KonselorFavCard(
                                        konselorId: filteredList[index].id,
                                        imageKonselor: filteredList[index].foto,
                                        nameKonselor: filteredList[index].nama,
                                        hospitalKonselor:
                                            filteredList[index].rumahSakit,
                                      ),
                                    )
                                  : KonselorFavCard(
                                      konselorId: filteredList[index].id,
                                      imageKonselor: filteredList[index].foto,
                                      nameKonselor: filteredList[index].nama,
                                      hospitalKonselor:
                                          filteredList[index].rumahSakit,
                                    ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Top Konselor',
                              style: primaryTextStyle.copyWith(
                                fontSize: 20,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: MediaQuery.of(context).size.height + 400,
                          child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 15),
                            itemCount: filteredList.length,
                            itemBuilder: (context, index) {
                              if (filteredList[index].ratingStar >= 4.5) {
                                return KonselorFavCard(
                                  konselorId: filteredList[index].id,
                                  imageKonselor: filteredList[index].foto,
                                  nameKonselor: filteredList[index].nama,
                                  hospitalKonselor:
                                      filteredList[index].rumahSakit,
                                );
                              } else {
                                return TopKonselorCard(
                                  konselorId: filteredList[index].id,
                                  imageKonselor: filteredList[index].foto,
                                  nameKonselor: filteredList[index].nama,
                                  hospital: filteredList[index].rumahSakit,
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
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
