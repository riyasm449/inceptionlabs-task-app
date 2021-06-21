import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _phoneNumber;
  String _otp;
  PhoneAuthCredential _phoneAuthCredential;
  String _verificationId;
  String get verificationId => _verificationId;
  String get phoneNumber => _phoneNumber;
  String get otp => _otp;
  FirebaseAuth get Auth => _auth;

  PhoneAuthCredential get phoneAuthCredential => _phoneAuthCredential;
  void changePhoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  void changeOtp(String value) {
    _otp = value;
  }

  Future<bool> sendOtp({GlobalKey<ScaffoldState> scaffoldkey, BuildContext context}) async {
    print(phoneNumber);
    if (phoneNumber != null) {
      await _auth.verifyPhoneNumber(
        phoneNumber: _phoneNumber,
        verificationCompleted: (phoneAuthCredential) async {
          _phoneAuthCredential = phoneAuthCredential;
          notifyListeners();
        },
        verificationFailed: (verificationFailed) async {
          scaffoldkey.currentState.showSnackBar(SnackBar(content: Text(verificationFailed.message)));
        },
        codeSent: (verificationId, resendingToken) async {
          _verificationId = verificationId;
          notifyListeners();
        },
        codeAutoRetrievalTimeout: (verificationId) async {},
      );
      return true;
    } else {
      scaffoldkey.currentState.showSnackBar(SnackBar(content: Text('Enter the phone number')));
      return false;
    }
  }

  Future<bool> signInWithPhoneAuthCredential(GlobalKey<ScaffoldState> scaffoldKey, BuildContext context) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: _otp);
      await _auth.signInWithCredential(credential);
      return true;
    } catch (e) {
      scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(e.message)));
      return false;
    }
  }
}
