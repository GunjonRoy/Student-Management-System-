import 'package:flutter/material.dart';

class TeacherPage extends StatefulWidget {
  @override
  _TeacherPageState createState() => _TeacherPageState();
}
class _TeacherPageState extends State<TeacherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 70),
          child: Text("Teacher Portal"),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white70,
          height: MediaQuery.of(context).size.height*1,
          width: MediaQuery.of(context).size.width*1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Container(
                height:MediaQuery.of(context).size.height*.38,
                width: MediaQuery.of(context).size.width*.98,
                color: Colors.teal,
              ),
              SizedBox(height: 10,),
              Container(
                height:MediaQuery.of(context).size.height*.38,
                width: MediaQuery.of(context).size.width*.98,
                color: Colors.lightGreenAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
