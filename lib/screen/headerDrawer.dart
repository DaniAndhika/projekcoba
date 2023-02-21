import "package:flutter/material.dart";
import 'package:catatan_apps/screen/login_screen.dart';
class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({Key? key}) : super(key: key);
  
@override
_MyHeaderDrawerState createState() => _MyHeaderDrawerState();

}
class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(32, 32, 34, 50),
      width: double.infinity,
      height: 200,
      padding : const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Icon(Icons.person_pin, size: 85, color: Colors.white),
            margin: const EdgeInsets.only(bottom: 10.0),
            height: 70.0,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
            ),
          ),
          const Text("DANI ANDHIKA AGISTAMA", 
          style: TextStyle(color: Colors.white, fontSize: 20 ),),
          const Text("200101123", style: TextStyle(color: Colors.white, fontSize: 16 ),),
        ],
      ),
    );
  }
}