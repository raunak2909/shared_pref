import 'package:flutter/material.dart';
import 'package:shared_pref/screens/second_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget{
  static final String uname_pref_key = "uName";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String? name;

  @override
  void initState() {
    super.initState();
    getNameFromPref();
  }

  void getNameFromPref() async{

    var prefs = await SharedPreferences.getInstance();
    name = prefs.getString(HomePage.uname_pref_key);
    setState(() {

    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(child: Text('Welcome, ${name ?? "Guest"}')),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(),));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}