import 'package:flutter/material.dart';
import '../actorBool/whoUser.dart';
import 'package:localstore/localstore.dart';
import 'log_in_page.dart';

import 'student/studentProfile_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool who =true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Student Management System")),
        ),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height*1,
            width: MediaQuery.of(context).size.width*1,
            color: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: AssetImage("images/student3.png"),

                    )
                  ),
                  ),
                SizedBox(height: 20,),
                Container(
                    height: 150,
                    width: 350,
//                    color: Colors.white30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white30,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 150,
                          width: 350,
                          //color: Colors.white30,
                          child: TextButton(
                              onPressed: (){
                                who=true;
                                print(who);
                                //Who(who);
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>LogInPage(who)));
                              },
                              child: Text("Teacher",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 50
                                ),
                              )
                          ),
                        )
                      ],
                    )
                ),
                SizedBox(height: 20,),
                Container(
                  height: 150,
                  width: 350,
//                  color: Colors.white30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white30,
                    ),
                  child: Column(
                    children: [
                      SizedBox(
                      height: 150,
                      width: 350,
                      //color: Colors.white30,
                        child: TextButton(
                            onPressed: (){
                              who=false;
                              print(who);
                              //HomePage().setWho(who);
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>LogInPage(who)));
                            },
                            child: Text("Student",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 50
                              ),
                            )
                        ),
                      )
                    ],
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
