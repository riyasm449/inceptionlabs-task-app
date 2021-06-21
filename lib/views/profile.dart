import 'package:flutter/material.dart';
import 'package:inceptionlabs_taskapp/utils/commons.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _fullName = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
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
            SizedBox(
              height: 10,
            ),
            Text(
              _userName.text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), border: Border.all(color: Commons.greyAccent3)),
              child: Column(
                children: [
                  textField(controller: _fullName, title: 'Full Name'),
                  textField(controller: _email, title: 'Email'),
                  textField(controller: _phoneNumber, title: 'Phone Number'),
                  textField(controller: _areaCode, title: 'Area Code'),
                  textField(controller: _userName, title: 'User Name'),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  Widget textField({TextEditingController controller, String title}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 13),
      ),
      subtitle: TextField(
        controller: controller,
        cursorColor: Commons.bgColor,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        decoration: InputDecoration(
            // border: OutlineInputBorder(),
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
