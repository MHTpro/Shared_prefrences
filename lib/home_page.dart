import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //my bool var
  bool myColor = false;

  //save my data (myColor)
  saveData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool("key1", myColor);
  }

  //load my data (myColor)
  loadData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(
      () {
        myColor = pref.getBool("key1") ?? false;
      },
    );
  }

  @override
  void initState() {
    //load my data
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(
              () {
                //change (myColor)
                myColor = !myColor;

                //save my data
                saveData();
              },
            );
          },
          child: Icon(
            Icons.sunny,
            size: 100.0,
            color: myColor == true ? Colors.amber : Colors.white24,
          ),
        ),
      ),
    );
  }
}
