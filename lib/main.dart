
import 'package:flutter/material.dart';
import 'package:kambascco/pages/SaccorList.dart';
import 'package:kambascco/pages/add_survey.dart';
import 'package:kambascco/pages/items.dart';
import 'package:kambascco/pages/login_page.dart';
import 'package:kambascco/pages/members.dart';
import 'package:kambascco/pages/myHomepage.dart';
import 'package:kambascco/pages/register_page.dart';
import 'package:kambascco/pages/splashScreen.dart';
import 'package:kambascco/pages/survey.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  double? _deviceHeight, _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      title: 'Kambasco App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: 'splash',
      routes: {
        'splash': (context) => SplashScreen(),
        'home': (context) => const MyHomePage(),
        'login': (context) => const login_page(),
        'register': (context) => const Register_Page(),
        'sacco_list': (context)=> const SaccolistPage(),
        'members' : (context)=> const MemberPage(),
        'survey_list': (context) => const SurveyListPage(),
        'add_survey': (context) => const add_survey(),
        'items': (context) => const items_page(),
      },
    );
  }
}