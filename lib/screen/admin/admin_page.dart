import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studentmanagementsystem/screen/admin/updateRoutine_page.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 80),
            child: Text("Admin Porrtal"),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.brown,
                        ),
                        height: MediaQuery.of(context).size.height*.20,
                        width: 180,
                        child: Center(child: Text("Exam Schedule")),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.deepOrangeAccent,
                        ),
                        height: MediaQuery.of(context).size.height*.20,
                        width: 180,
                        //color: Colors.deepPurpleAccent,
                        child: Center(child: Text("Event Schedule")),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.lightGreen,
                ),
                height: MediaQuery.of(context).size.height*.15,
                width: 250,
                //color: Colors.deepPurpleAccent,
                child: Center(child: Text("Teacher enrollment")),
              ),
              SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.deepOrangeAccent,
                      ),
                      height: MediaQuery.of(context).size.height*.20,
                      width: 180,
                      //color: Colors.deepPurpleAccent,
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height*.20,
                            width: 180,
                            //color: Colors.white30,
                            child: TextButton(
                                onPressed: ()async{
                                  await _firestore
                                      .collection('routin')
                                      .doc('cse')
                                      .set({
                                    "sub1": "cse101",
                                    "sub2": "cse201",
                                    "sub3": "cse301",
                                    "sub4": "cse401",
                                    "t1": "Teacher1",
                                    "t2": "Teacher2",
                                    "t3": "Teacher3",
                                    "t4": "Teacher4",
                                    "day1":"Saturday",
                                    "day2":"Sunday",
                                    "day3":"Tuesday",
                                    "time1":"9:00-10:20am",
                                    "time2":"10:30-11:50am",
                                    "time3":"12:00-1:20pm",
                                    "r1":"AB-1(102)",
                                    "r2":"AB-1(202)",
                                    "r3":"AB-1(105)",
                                    "r4":"AB-1(402)",


                                  });
                                  //Who(who);
                                  print("go to Update Routine");
                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>UpdateRoutine()));
                                },
                                child: Text("Update Routine",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20
                                  ),
                                )
                            ),
                          )
                        ],
                      )
                    ),
                    SizedBox(width: 10,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.brown,
                      ),
                      height: MediaQuery.of(context).size.height*.20,
                      width: 180,
//                      color: Colors.brown,
                      child: Center(child: Text("Class Routine")),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 8,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.lightGreen,
                ),
                height: MediaQuery.of(context).size.height*.15,
                width: 250,
                //color: Colors.deepPurpleAccent,
                child: Center(child: Text("Student Enrollment")),
              ),
            ],
          ),
        ),
      ),
    );;
  }
}
