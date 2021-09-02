import 'package:flutter/material.dart';
import 'package:studentmanagementsystem/screen/home_page.dart';
import 'package:studentmanagementsystem/screen/student/student_page.dart';

class Drawerneg extends StatefulWidget {
  @override
  _DrawernegState createState() => _DrawernegState();
}

class _DrawernegState extends State<Drawerneg> {
  String? status;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder()
                ),
                onPressed: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>Student_page("p")));
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Student_page("p")), (route) => false);
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage("images/gunjon.png"),
                  radius: 80,
                  child: Text("Profile"),
                ),

              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: BeveledRectangleBorder(

                    ),
                  primary: Colors.black12
                ),
                onPressed: () {
                },
                child: Text("Result"),

              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: BeveledRectangleBorder(

                    ),
                    primary: Colors.black12
                ),
                onPressed: () {
                },
                child: Text("Class Routine"),

              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: BeveledRectangleBorder(

                    ),
                    primary: Colors.black12
                ),
                onPressed: () {
                },
                child: Text("online Class Room"),

              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: BeveledRectangleBorder(

                    ),
                    primary: Colors.black12
                ),
                onPressed: () {
                },
                child: Text("notice board"),

              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: BeveledRectangleBorder(

                    ),
                    primary: Colors.black12
                ),
                onPressed: () {
                },
                child: Text("Chat Room"),

              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: BeveledRectangleBorder(

                    ),
                    primary: Colors.black12
                ),
                onPressed: () {
                },
                child: Text("Home work"),

              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: BeveledRectangleBorder(

                    ),
                    primary: Colors.black12
                ),
                onPressed: () {
                },
                child: Text("Assignment"),

              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: BeveledRectangleBorder(

                    ),
                    primary: Colors.black12
                ),
                onPressed: () {
                  status="up";
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>Student_page(status)));
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Student_page("up")), (route) => false);
                },
                child: Text("Update Profile"),

              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: BeveledRectangleBorder(

                    ),
                    primary: Colors.black12
                ),
                onPressed: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
                },
                child: Text("Log Out"),

              ),

//              Container(
//                width: 200,
//                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.circular(20),
//                  color:Colors.white70,
//                  border: Border.all(color: Colors.black),
//                ),
//                child: FlatButton(
//                    splashColor: Colors.grey,
//                    onPressed: (){
//                      setState(() {
//
//                      });
//                    },
//                    child: Text("DATA-1",
//                      style: TextStyle(
//                          fontSize: 20,
//                          fontWeight: FontWeight.bold
//                      ),
//                    )
//                ),
//              ),


            ],
          ),
        ),
      ),
    );
  }
}
