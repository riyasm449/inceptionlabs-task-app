// import 'package:flutter/material.dart';
// import 'package:inceptionlabs_taskapp/utils/auth.dart';
// import 'package:provider/provider.dart';
// import 'package:sms_autofill/sms_autofill.dart';
//
// import '/utils/commons.dart';
//
// class OtpPage extends StatefulWidget {
//   @override
//   _OtpPageState createState() => _OtpPageState();
// }
//
// class _OtpPageState extends State<OtpPage> {
//   TextEditingController otpController = TextEditingController();
//   AuthProvider _authProvider = AuthProvider();
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     _authProvider = Provider.of<AuthProvider>(context);
//     void changeCode(String value) {
//       _authProvider.changeOtp(value);
//       if (value.length == 6) {
//         _authProvider.signInWithPhoneAuthCredential(_scaffoldKey, context);
//         print('filled');
//       }
//       print(value);
//     }
//
//     return Scaffold(
//       key: _scaffoldKey,
//       body: Column(
//         children: [
//           Commons.topBar(context),
//           SizedBox(
//             height: 25,
//           ),
//           Container(
//             width: MediaQuery.of(context).size.width,
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: Text(
//               'Verification Code',
//               style: TextStyle(color: Colors.black, fontSize: 35, fontWeight: FontWeight.w800),
//             ),
//           ),
//           Container(
//             width: MediaQuery.of(context).size.width,
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: Text(
//               'Please type the verification code sent to',
//               style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w800),
//             ),
//           ),
//           Container(
//             width: MediaQuery.of(context).size.width,
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: Text(
//               '+919361144746',
//               style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w800),
//             ),
//           ),
//           SizedBox(
//             height: 25,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: PinFieldAutoFill(
//                 controller: otpController,
//                 decoration: BoxLooseDecoration(
//                   strokeColorBuilder: PinListenColorBuilder(Commons.bgColor, Colors.grey),
//                 ),
//                 onCodeChanged: changeCode,
//                 autofocus: true,
//                 codeLength: 6),
//           ),
//           SizedBox(
//             height: 25,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'I don\'t receive the code! ',
//                 style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w800),
//               ),
//               Text(
//                 'Please Resend',
//                 style: TextStyle(color: Commons.bgColor, fontSize: 15, fontWeight: FontWeight.w800),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
