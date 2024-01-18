import 'dart:async';
import 'package:flutter/material.dart';
import 'package:warasin/Widget/logo_warasin_green.dart';
import 'package:warasin/theme.dart';

class FillProfileScreen extends StatefulWidget {
  @override
  State<FillProfileScreen> createState() => _FillProfileScreenState();
}

class _FillProfileScreenState extends State<FillProfileScreen> {
  List<String> provinceList = [
    'Aceh',
    'Sumatera Utara',
    'Sumatera Selatan',
    'Sumatera Barat',
    'Bengkulu',
    'Riau',
    'Kepulauan Riau',
    'Jambi',
    'Lampung',
    'Bangka Belitung',
    'Kalimantan Barat',
    'Kalimantan Timur',
    'Kalimantan Selatan',
    'Kalimantan Tengah',
    'Kalimantan Utara',
    'Banten',
    'DKI Jakarta',
    'Jawa Barat',
    'Jawa Tengah',
    'Yogyakarta',
    'Jawa Timur',
    'Bali',
    'Nusa Tenggara Timur',
    'Nusa Tenggara Barat',
    'Gorontalo',
    'Sulawesi Barat',
    'Sulawesi Tengah',
    'Sulawesi Utara',
    'Sulawesi Tenggara',
    'Sulawesi Selatan',
    'Maluku Utara',
    'Maluku',
    'Papua Barat',
    'Papua',
    'Papua Tengah',
    'Papua Pegunungan',
    'Papua Selatan',
    'Papua Barat Daya',
  ];
  List<String> genderList = [
    'Pria',
    'Wanita',
    'Lainnya',
  ];
  DateTime selectedDate = DateTime.now();
  TextEditingController dateController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  bool isPhoneNumberValid = false;
  bool isAgeValid = false;
  String? selectedProvince;
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    onPhoneNumberChanged(String value) {
      final phoneNumber = value.replaceAll('+62 ', '');
      final phoneNumberRegex = RegExp(r'^[0-9]{10,13}$');
      setState(() {
        isPhoneNumberValid = phoneNumberRegex.hasMatch(phoneNumber);
      });
    }

    void onProvinceChanged(String? province) {
      setState(() {
        selectedProvince = province;
      });
    }

    void onGenderChanged(String? gender) {
      setState(() {
        selectedGender = gender;
      });
    }

    Future<void> _selectDate(BuildContext context) async {
      DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        cancelText: 'Kembali',
        confirmText: 'Ok',
        barrierDismissible: false,
        errorFormatText: 'Tolong masukkan tanggal dengan benar!',
        errorInvalidText: 'Diluar jangkauan',
        fieldHintText: 'dd/mm/yyy',
        helpText: 'Pilih tanggal lahirmu...',
        keyboardType: TextInputType.datetime,
        fieldLabelText: 'Masukkan tanggal lahirmu',
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.year,
      );
      if (picked != null && picked != selectedDate) {
        setState(
          () {
            selectedDate = picked;
            dateController.text =
                '${picked.day}/${picked.month}/${picked.year}';
          },
        );
      } else {
        dateController.clear();
      }
    }

    Future<void> showFailedDialog(String message) async {
      return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => Container(
          child: AlertDialog(
            backgroundColor: dangerColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icon_close.png',
                    width: 90,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    'Gagal!',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    message,
                    style: secondaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: backgroundColorWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 11,
                        horizontal: 47,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Kembali',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Future<void> showSuccessDialog() async {
      return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => Container(
          child: AlertDialog(
            backgroundColor: successColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icon_check.png',
                    width: 90,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Terima Kasih!',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Biodata kamu sudah terisi!',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: backgroundColorWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 11,
                        horizontal: 36,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/main', (route) => false);
                    },
                    child: Text(
                      'Dashboard',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    _handleFillProfile() {
      if (selectedGender != null &&
          dateController.text.isNotEmpty &&
          selectedProvince != null &&
          isPhoneNumberValid) {
        showSuccessDialog();
      } else {
        print('Incomplete data entry');
        showFailedDialog('Ada beberapa form yang belum diisi!');
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          vertical: 72,
          horizontal: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LogoWarasinGreen(),
            SizedBox(
              height: 30,
            ),
            Text(
              'Langkah terakhir, lengkapi biodata mu...',
              style: primaryTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 37,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: backgroundColorGrey,
              ),
              child: DropdownButtonFormField<String>(
                borderRadius: BorderRadius.circular(20),
                icon: Image.asset(
                  'assets/icon_gender.png',
                  width: 20,
                  fit: BoxFit.cover,
                ),
                value: selectedGender,
                onChanged: onGenderChanged,
                items: genderList
                    .map(
                      (gender) =>
                          DropdownMenuItem(value: gender, child: Text(gender)),
                    )
                    .toList(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Gender',
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
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                _selectDate(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: backgroundColorGrey,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 20,
                        ),
                        child: Text(
                          dateController.text.isEmpty
                              ? 'Tanggal Lahir'
                              : dateController.text,
                          style: primaryTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: regular,
                            color: dateController.text.isEmpty
                                ? backgroundColorWhite
                                : primaryTextColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 10,
                      ),
                      child: IconButton(
                        onPressed: () {
                          _selectDate(context);
                        },
                        icon: Image.asset(
                          'assets/icon_date.png',
                          fit: BoxFit.cover,
                          width: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: backgroundColorGrey,
              ),
              child: DropdownButtonFormField<String>(
                borderRadius: BorderRadius.circular(20),
                icon: Image.asset(
                  'assets/icon_country.png',
                  width: 20,
                  fit: BoxFit.cover,
                ),
                value: selectedProvince,
                onChanged: onProvinceChanged,
                items: provinceList
                    .map(
                      (province) => DropdownMenuItem<String>(
                        value: province,
                        child: Text(
                          province,
                          style: primaryTextStyle,
                        ),
                      ),
                    )
                    .toList(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Provinsi',
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
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: backgroundColorGrey,
              ),
              child: TextFormField(
                controller: phoneNumberController,
                onChanged: onPhoneNumberChanged,
                autocorrect: false,
                cursorColor: primaryTextColor,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixText: '+62 ',
                  prefixStyle: primaryTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: regular,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/icon_call.png',
                        fit: BoxFit.cover,
                        width: 20,
                      ),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  hintText: '8XXXXXXXX',
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
            SizedBox(
              child: isPhoneNumberValid
                  ? null
                  : !isPhoneNumberValid && phoneNumberController.text.isNotEmpty
                      ? Text(
                          'Tolong masukkan nomor dengan benar!',
                          style: dangerTextStyle.copyWith(
                            fontSize: 13,
                            fontWeight: regular,
                          ),
                        )
                      : null,
              height: 20,
            ),
            Spacer(),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                padding: EdgeInsets.symmetric(
                  vertical: 17,
                  horizontal: 132,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: _handleFillProfile,
              child: Text(
                'Selesai',
                style: secondaryTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
