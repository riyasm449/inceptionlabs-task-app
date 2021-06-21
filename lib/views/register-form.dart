import 'package:flutter/material.dart';
import 'package:inceptionlabs_taskapp/utils/commons.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _userName = TextEditingController();
  TextEditingController _areaCode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Commons.topBar(context),
            profileField(),
            textField(controller: _userName, title: 'User Name'),
            Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: textField(controller: _firstName, title: 'First Name')),
                Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: textField(controller: _lastName, title: 'Last Name')),
              ],
            ),
            textField(controller: _email, title: 'Email'),
            textField(controller: _areaCode, title: 'Area Code'),
            SizedBox(
              height: 100,
            ),
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  // image: DecorationImage(image: AssetImage('assets/images/profile.png')),
                  color: Commons.bgColor),
              child: Text(
                'CREATE ACCOUNT',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget textField({TextEditingController controller, String title}) {
    return ListTile(
      title: Text(title),
      subtitle: TextField(
        controller: controller,
        cursorColor: Commons.bgColor,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget profileField() {
    return Stack(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            image: DecorationImage(image: AssetImage('assets/images/profile.png')),
          ),
        ),
        Positioned(
            bottom: 1,
            right: 1,
            child: Container(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    blurRadius: 2.0, // soften the shadow
                    spreadRadius: 1.5, //extend the shadow
                    offset: Offset(
                      1.0, // Move to right 10  horizontally
                      1.0, // Move to bottom 10 Vertically
                    ),
                  ),
                ],
              ),
              child: Icon(
                Icons.camera_alt_rounded,
                size: 20,
                color: Commons.greyAccent3,
              ),
            )),
      ],
    );
  }
}
