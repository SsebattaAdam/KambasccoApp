import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SurveyListPage extends StatefulWidget {
  const SurveyListPage({super.key});

  @override
  State<SurveyListPage> createState() => _SurveyListPageState();
}

class _SurveyListPageState extends State<SurveyListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("Survey List"),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:  Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _firstItem1(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _firstItem1(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TextButton(
          onPressed: () {}, // Add your onPressed methods here
          child: const Text(
            'Member List',
            style: TextStyle(
              fontSize: 20, // adjust as needed
              fontWeight: FontWeight.bold, // adjust as needed
              color: Colors.blue, // adjust as needed
            ),
          ),
        ),
        Row(
          children: <Widget>[

            TextButton(
              onPressed: () {
              Navigator.pushNamed(context, 'add_survey');
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey,
              ),
              child: const Text(
                'Add New Survey',
                style: TextStyle(
                  fontSize: 20, // adjust as needed
                  fontWeight: FontWeight.bold, // adjust as needed
                  color: Colors.white, // adjust as needed
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
