import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '/utils/auth.dart';
import '/utils/commons.dart';
import '/utils/phone-number.dart';
import '/utils/timer_button.dart';

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
  bool showOtp = false;

  @override
  void initState() {
    super.initState();
  }

  void setLoading(bool value) {
    setState(() {
      showLoading = value;
    });
  }

  void changeCode(String value) async {
    _authProvider.changeOtp(value);
    if (value.length == 6) {
      Future.delayed(const Duration(seconds: 2));
      _authProvider.signInWithPhoneAuthCredential(_scaffoldKey, context);
      print('filled');
    }
    print(value);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Column(
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
              if (!showLoading) phoneNumberField()
            ],
          ),
        ));
  }

  Widget phoneNumberField() {
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
                _authProvider.changePhoneNumber(phone.completeNumber);
              },
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        showOtp ? otpField() : sendOtpButton()
      ],
    );
  }

  Widget otpField() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: PinFieldAutoFill(
              controller: otpController,
              decoration: BoxLooseDecoration(
                strokeColorBuilder: PinListenColorBuilder(Commons.bgColor, Colors.grey),
              ),
              onCodeChanged: changeCode,
              autofocus: true,
              codeLength: 6),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'I don\'t receive the code! ',
              style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w800),
            ),
            TimerButton(
              label: "Please Resend",
              timeOutInSeconds: 30,
              onPressed: () {
                setLoading(true);
                _authProvider.sendOtp(scaffoldkey: _scaffoldKey, context: context);
                setLoading(false);
              },
              buttonType: ButtonType.FlatButton,
              disabledColor: Colors.red,
              color: Colors.transparent,
              disabledTextStyle: new TextStyle(fontSize: 12.0, color: Colors.grey),
              activeTextStyle: new TextStyle(fontSize: 12.0, color: Commons.bgColor, fontWeight: FontWeight.bold),
            )
          ],
        )
      ],
    );
  }

  Widget sendOtpButton() {
    return GestureDetector(
      onTap: () async {
        setLoading(true);
        await _authProvider.sendOtp(scaffoldkey: _scaffoldKey, context: context).then((value) {
          setState(() {
            showOtp = value;
          });
        });
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
