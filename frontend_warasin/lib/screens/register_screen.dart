import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warasin/Widget/logo_warasin_green_big.dart';
import 'package:warasin/providers/auth_provider.dart';
import 'package:warasin/theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController(text: '');
  final namaController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  bool isVisible = false;
  bool isEmailValid = false;
  bool isNamaValid = false;
  bool isPasswordValid = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

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
                    height: 11,
                  ),
                  Text(
                    'Terima Kasih!',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    'Akun kamu telah terdaftar!',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                    ),
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
                      padding: EdgeInsets.all(11),
                    ),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/login', (route) => false);
                    },
                    child: Text(
                      'Kembali ke Login',
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
                      Navigator.of(context).pop();
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

    onEmailChanged(String email) {
      final emailRegex = RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
      setState(() {
        isEmailValid = false;
        if (emailRegex.hasMatch(email)) {
          isEmailValid = true;
        }
      });
    }

    onNamaChanged(String nama) {
      final namaRegex = RegExp(r'^(?=.*[A-Z])[A-Za-z ]+$');
      setState(() {
        isNamaValid = false;
        if (namaRegex.hasMatch(nama)) {
          isNamaValid = true;
        }
      });
    }

    onPasswordChanged(String password) {
      RegExp passwordUppercaseRegex = RegExp(r'[A-Z]');
      final passwordUppercaseValid = passwordUppercaseRegex.hasMatch(password);
      setState(() {
        isPasswordValid = false;
        if (password.length >= 8 && passwordUppercaseValid) {
          isPasswordValid = true;
        }
      });
    }

    _handleRegister() async {
      try {
        if (namaController.text.isNotEmpty &&
            emailController.text.isNotEmpty &&
            passwordController.text.isNotEmpty &&
            isEmailValid &&
            isPasswordValid &&
            isNamaValid) {
          bool registrationSuccess = await authProvider.register(
            nama: namaController.text,
            email: emailController.text,
            password: passwordController.text,
          );
          if (registrationSuccess) {
            await showSuccessDialog();
            Navigator.pushNamed(context, '/login');
          } else {
            print('Registration failed');
            await showFailedDialog('Registrasi Gagal!');
          }
        } else {
          print('Registration failed');
          await showFailedDialog('Ada beberapa form yang belum diisi!');
        }
      } catch (e) {
        print('Registration error: $e');
        await showFailedDialog(e.toString());
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 50,
          // vertical: 72,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 72),
              child: LogoWarasinGreenBig(),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Selamat Datang di Warasin!',
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              'Jaga kesehatan mentalmu bersama Warasin!',
              style: tertiaryTextStyle.copyWith(
                fontSize: 15,
                fontWeight: medium,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 37,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: backgroundColorGrey,
              ),
              child: TextFormField(
                controller: emailController,
                onChanged: (email) => onEmailChanged(email),
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                // validator: validateEmail,
                autocorrect: false,
                cursorColor: primaryTextColor,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Email',
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
              child: isEmailValid
                  ? null
                  : !isEmailValid && emailController.text.isNotEmpty
                      ? Text(
                          'Tolong masukkan email dengan benar!',
                          style: dangerTextStyle.copyWith(
                            fontSize: 13,
                            fontWeight: regular,
                          ),
                        )
                      : null,
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: backgroundColorGrey,
              ),
              child: TextFormField(
                controller: namaController,
                onChanged: (nama) => onNamaChanged(nama),
                autocorrect: false,
                cursorColor: primaryTextColor,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Nama',
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
              child: isNamaValid
                  ? null
                  : !isNamaValid && namaController.text.isNotEmpty
                      ? Text(
                          'Hanya huruf, 1 huruf kapital, dan tidak angka!',
                          style: dangerTextStyle.copyWith(
                            fontSize: 13,
                            fontWeight: regular,
                          ),
                        )
                      : null,
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: backgroundColorGrey,
              ),
              child: TextFormField(
                controller: passwordController,
                onChanged: (password) => onPasswordChanged(password),
                autocorrect: false,
                cursorColor: primaryTextColor,
                obscureText: !isVisible,
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      icon: Icon(
                        isVisible ? Icons.visibility : Icons.visibility_off,
                        color: primaryTextColor,
                      ),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Password',
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
              child: isPasswordValid
                  ? null
                  : !isPasswordValid && passwordController.text.isNotEmpty
                      ? Text(
                          'Minimal 8 karakter dan 1 huruf kapital!',
                          style: dangerTextStyle.copyWith(
                            fontSize: 13,
                            fontWeight: regular,
                          ),
                        )
                      : null,
              height: 40,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 127,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () => _handleRegister(),
              child: Text(
                'Register',
                style: secondaryTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sudah punya akun?',
                    style: primaryTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: regular,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      ' Login!',
                      style: logoTextStyleGreen.copyWith(
                        fontSize: 15,
                        fontWeight: regular,
                      ),
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
