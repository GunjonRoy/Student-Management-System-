import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
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
              Padding(
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
                      width: 185,
                      child: Center(child: Text("Exam Schedule")),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.deepOrangeAccent,
                      ),
                      height: MediaQuery.of(context).size.height*.20,
                      width: 185,
                      //color: Colors.deepPurpleAccent,
                      child: Center(child: Text("Event Schedule")),
                    )
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
                      width: 185,
                      //color: Colors.deepPurpleAccent,
                      child: Center(child: Text("Record Result")),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.brown,
                      ),
                      height: MediaQuery.of(context).size.height*.20,
                      width: 185,
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
