import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/utils/auth.dart';
import '/views/register-form.dart';
import 'utils/app-theme.dart';
import 'views/home.dart';
import 'views/login-page.dart';
import 'views/splash-screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: appTheme,
          home: SplashScreen(),
          routes: <String, WidgetBuilder>{
            '/splash': (BuildContext context) => SplashScreen(),
            '/login': (BuildContext context) => LoginPage(),
            '/home': (BuildContext context) => HomePage(),
            '/register': (BuildContext context) => RegistrationPage(),
          }),
    );
  }
}
