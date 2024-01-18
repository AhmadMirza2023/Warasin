import 'package:flutter/material.dart';
import 'package:warasin/Widget/logo_warasin_green_big.dart';
import 'package:warasin/theme.dart';

class AiScreen extends StatelessWidget {
  const AiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LogoWarasinGreenBig(),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'Maaf sebelumnya, untuk fitur ini masih dalam perbaikan, jadi harap sabar yaa, terima kasih!',
                style: primaryTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: regular,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
