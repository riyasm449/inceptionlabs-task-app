import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/auth.dart';
import '../utils/commons.dart';
import '../utils/phone-number.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controller = TextEditingController();
  String completeNumber;
  String verificationId;
  AuthProvider _authProvider = AuthProvider();
  bool showLoading = false;
  void changeNumber(String value) {}

  void setLoading(bool value) {
    setState(() {
      showLoading = value;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    _authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
        key: _scaffoldKey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Commons.topBar(context),
            SizedBox(
              height: 15,
            ),
            if (showLoading)
              Center(
                  child: CircularProgressIndicator(
                backgroundColor: Commons.bgColor,
              )),
            if (!showLoading) body()
          ],
        ));
  }

  Widget body() {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Enter Mobile',
            style: TextStyle(color: Colors.black, fontSize: 35, fontWeight: FontWeight.w800),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Number',
            style: TextStyle(color: Colors.black, fontSize: 35, fontWeight: FontWeight.w800),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Enter your phone number to verify',
            style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w800),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'your account and place order.',
            style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w800),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            child: PhoneField(
              controller: controller,
              initialCountryCode: 'IN',
              onChanged: (phone) {
                changeNumber(phone.completeNumber);
                _authProvider.changePhoneNumber(phone.completeNumber);
              },
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        sendOtpButton()
      ],
    );
  }

  Widget sendOtpButton() {
    return GestureDetector(
      onTap: () async {
        setLoading(true);
        await _authProvider.sendOtp(scaffoldkey: _scaffoldKey, context: context);

        setLoading(false);
      },
      child: Container(
        width: 250,
        height: 60,
        decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(40)),
        alignment: Alignment.center,
        child: Text(
          'SEND',
          style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w800, letterSpacing: 1.5),
        ),
      ),
    );
  }
}
