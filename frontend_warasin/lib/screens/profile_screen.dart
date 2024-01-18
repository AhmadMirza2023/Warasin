import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warasin/Widget/logo_warasin_green_big.dart';
import 'package:warasin/providers/auth_provider.dart';
import 'package:warasin/theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
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
            SizedBox(
              height: 15,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: dangerColor,
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 40,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                authProvider.logout();
                Navigator.of(context).pushReplacementNamed('/');
              },
              child: Text(
                'Logout',
                style: secondaryTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
