import 'package:flutter/material.dart';
import 'package:shared_pref/screens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  var nameController = TextEditingController();

  void setNameInPref({required String name}) async{

    /*SharedPreferences.getInstance().then((value){

    });*/

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(HomePage.uname_pref_key, name);



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('Set Value')),
      body: Column(
        children: [
          TextField(
            controller: nameController,
          ),
          SizedBox(
            height: 11,
          ),
          ElevatedButton(onPressed: (){

            ///save name in prefs
            if(nameController.text.isNotEmpty) {
              setNameInPref(name: nameController.text);
            }

          }, child: Text('Save'))
        ],
      ),
    );
  }
}
