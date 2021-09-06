import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studentmanagementsystem/screen/teacher/drawerNegT.dart';

class TeacherPage extends StatefulWidget {
  String? status;
  TeacherPage(String? status) {
    this.status = status;
  }
  @override
  _TeacherPageState createState() => _TeacherPageState(status);
}

class _TeacherPageState extends State<TeacherPage> {
  String? status;
  _TeacherPageState(String? status) {
    this.status = status;
  }

  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  TextEditingController _cntName = TextEditingController();
  TextEditingController _cntFname =TextEditingController();
  TextEditingController _cntMname = TextEditingController();
  TextEditingController _cntPerAdd = TextEditingController();
  TextEditingController _cntPreAdd = TextEditingController();
  TextEditingController _cntPhone = TextEditingController();
  TextEditingController _cntEmail = TextEditingController();
  //TextEditingController _cntName = TextEditingController();
  bool _isEnable = false;
  String? name,email,phoneN,statusU,uId,fName,mName,perAdd,preAdd;

  getProfile()async{
    try{
      final collection = FirebaseFirestore.instance.collection('teacher user');
      final querySnapshot = await collection.doc(_firebaseAuth.currentUser!.uid).get().then((value){
        this.fName=value["Father's name"];
        this.name=_firebaseAuth.currentUser!.displayName.toString();
        this.email=_firebaseAuth.currentUser!.email.toString();
        this.phoneN=value["phoneNumber"];
        this.statusU=value["status"];
        this.uId=_firebaseAuth.currentUser!.uid.toString();
        this.mName=value["Mother's name"];
        this.perAdd=value["Permanent Address"];
        this.preAdd=value["present Address"];
        //TextEditingController _cntFname =TextEditingController(text: fName.toString());
      });
      print(this.fName.toString()+"...........ok.............");

    }catch(e){
      print(e);
    }
  }
  String? day1,day2,day3,time1,time2,time3;
  String? t1,t2,t3,t4;
  String? sub1,sub2,sub3,sub4;
  String? r1,r2,r3,r4;
  getRoutine()async{
    try{
      final collection = FirebaseFirestore.instance.collection('routin');
      final querySnapshot = await collection.doc('cse').get().then((value){
        this.sub1=value["sub1"];
        this.sub2=value["sub2"];
        this.sub3=value["sub3"];
        this.sub4=value["sub4"];
        this.t1=value["t1"];
        this.t2=value["t2"];
        this.t3=value["t3"];
        this.t4=value["t4"];
        this.day1=value["day1"];
        this.day2=value["day2"];
        this.day3=value["day3"];
        this.time1=value["time1"];
        this.time2=value["time2"];
        this.time3=value["time3"];
        this.r1=value["r1"];
        this.r2=value["r2"];
        this.r3=value["r3"];
        this.r4=value["r4"];
        //TextEditingController _cntFname =TextEditingController(text: fName.toString());
      });
      print(this.sub1.toString()+"...........ok.............");

    }catch(e){
      print(e);
    }
  }

  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    //getProfile();
//  }
  //_cntFname = TextEditingController(text: fName);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text("Teacher Portal")),
          ),
          drawer: DrawernegT(),
          body: _build_Body(status)),
    );
  }

  Widget _build_Body(String? status) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (status == "p") ...[
              _build_ShowProfile()
            ] else if (status == "r") ...[
              _build_ShowResult()
            ] else if (status == "clr") ...[
              _build_ClassRoutine()
            ] else if (status == "ocr") ...[
              _build_OnlineClassRoom()
            ] else if (status == "nb") ...[
              _build_NoticeBoard()
            ] else if (status == "chr") ...[
              _build_ChatRoom()
            ] else if (status == "hw") ...[
              _build_HomeWork()
            ] else if (status == "a") ...[
              _build_Assignment()
            ] else if (status == "up") ...[
              _build_UpdateProfile()
            ]
          ],
        ),
      ),
    );
  }

  Widget _build_ShowProfile() {
    //getProfile();
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
              future: getProfile(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {


                return Column(
                  children: [
                    Center(
                        child: Text(
                          'Your profile',
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        )),
                    DataTable(
                      columns: [
//              DataColumn(label: Text(
//                  'ID',
//                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
//              )),
                        DataColumn(
                            label: Text(
                              'Name',
                              //style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                            )),
                        DataColumn(
                            label: Text(
                              name.toString(),
                              //style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                            )),
                      ],
                      rows: [
                        DataRow(cells: [
//                DataCell(Text('15')),
                          DataCell(Text('profile pic')),
                          DataCell(
                            CircleAvatar(
                              backgroundImage: AssetImage("images/teacher.png"),
                              radius: 30,
                              //child: Text("Profile"),
                            ),
                          ),
                        ]),
                        DataRow(cells: [
//                DataCell(Text('1')),
                          DataCell(Text("father's Name")),
                          DataCell(Text(fName.toString())),
                        ]),
                        DataRow(cells: [
//                DataCell(Text('5')),
                          DataCell(Text("Mother's Name")),
                          DataCell(Text(mName.toString())),
                        ]),
                        DataRow(cells: [
//                DataCell(Text('10')),
                          DataCell(Text('Permanent Address')),
                          DataCell(Text(perAdd.toString())),
                        ]),
                        DataRow(cells: [
//                DataCell(Text('15')),
                          DataCell(Text('present address')),
                          DataCell(Text(preAdd.toString())),
                        ]),
                        DataRow(cells: [
//                DataCell(Text('15')),
                          DataCell(Text('Phone No')),
                          DataCell(Text(phoneN.toString())),
                        ]),
                        DataRow(cells: [
//                DataCell(Text('15')),
                          DataCell(Text('Email')),
                          DataCell(Text(email.toString())),
                        ]),
                      ],
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }

  Widget _build_ShowResult() {
    return Container();
  }

  Widget _build_EditProfile() {
    return Container();
  }

  Widget _build_ClassRoutine() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
              future: getRoutine(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {


                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      //color: Colors.black12,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Class Routine",
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text("DepartMent: Computer Science and Engineering",
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text("Semister:Fall,2021",
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: [
//              DataColumn(label: Text(
//                  'ID',
//                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
//              )),
                          DataColumn(
                              label: Text(
                                "Day",
                                //style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                              )),
                          DataColumn(
                              label: Text(
                                time1.toString(),
                                //style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                              )),
                          DataColumn(
                              label: Text(
                                time2.toString(),
                                //style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                              )),
                          DataColumn(
                              label: Text(
                                time3.toString(),
                                //style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                              )),
                        ],
                        rows: [
                          DataRow(cells: [
//                DataCell(Text('15')),
                            DataCell(Text(day1.toString())),
                            DataCell(Text(sub1.toString()+"\n"+t1.toString()+"\n"+r1.toString())),
                            DataCell(Text(sub2.toString()+"\n"+t1.toString()+"\n"+r1.toString())),
                            DataCell(Text(sub1.toString()+"\n"+t1.toString()+"\n"+r1.toString())),
                          ]),
                          DataRow(cells: [
//                DataCell(Text('1')),
                            DataCell(Text(day2.toString())),
                            DataCell(Text(sub2.toString()+"\n"+t2.toString()+"\n"+r2.toString())),
                            DataCell(Text(sub2.toString()+"\n"+t1.toString()+"\n"+r1.toString())),
                            DataCell(Text(sub1.toString()+"\n"+t1.toString()+"\n"+r1.toString())),
                          ]),
                          DataRow(cells: [
//                DataCell(Text('5')),
                            DataCell(Text(day3.toString())),
                            DataCell(Text(sub3.toString()+"\n"+t3.toString()+"\n"+r3.toString())),
                            DataCell(Text(sub2.toString()+"\n"+t1.toString()+"\n"+r1.toString())),
                            DataCell(Text(sub1.toString()+"\n"+t1.toString()+"\n"+r1.toString())),
                          ]),

                        ],
                      ),
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }

  Widget _build_OnlineClassRoom() {
    return Container();
  }

  Widget _build_NoticeBoard() {
    return Container();
  }

  Widget _build_ChatRoom() {
    return Container();
  }

  Widget _build_HomeWork() {
    return Container();
  }

  Widget _build_Assignment() {
    return Container();
  }

  Widget _build_UpdateProfile() {
    getProfile();
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(children: <Widget>[
                  Center(
                      child: Text(
                        'Edit profile',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      )),
                  DataTable(
                    columns: [
//              DataColumn(label: Text(
//                  'ID',
//                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
//              )),
                      DataColumn(
                          label: Text(
                            'Name',
                            //style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                          )),
                      DataColumn(
                          label: Row(
                            children: <Widget>[
                              Container(
                                width: 100,
                                child: TextField(
                                  controller: _cntName,
                                  //enabled: true,//_isEnable,
                                  decoration: InputDecoration(
                                      labelText: "$name"//name.toString()//_firebaseAuth.currentUser!.displayName.toString()
                                  ),
                                ),
                              ),
//                          IconButton(
//                              icon: Icon(Icons.edit),
//                              onPressed: () {
//                                setState(() {
//                                  _isEnable = true;
//                                });
//                              })
                            ],
                          )),
                    ],
                    rows: [
                      DataRow(cells: [
//                DataCell(Text('15')),
                        DataCell(Text('profile pic')),
                        DataCell(
                          CircleAvatar(
                            backgroundImage: AssetImage("images/teacher.png"),
                            radius: 30,
                            //child: Text("Profile"),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
//                DataCell(Text('1')),
                        DataCell(Text("father's Name")),
                        DataCell(
                          Row(
                            children: <Widget>[
                              Container(
                                width: 100,
                                child: TextField(
                                  controller: _cntFname,
                                  enabled: _isEnable,
                                  decoration: InputDecoration(
                                    hintText: fName.toString(),
                                  ),
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    setState(() {
                                      _isEnable = true;
                                    });
                                  })
                            ],
                          ),
                        ),
                      ]),
                      DataRow(cells: [
//                DataCell(Text('5')),
                        DataCell(Text("Mother's Name")),
                        DataCell(Row(
                          children: <Widget>[
                            Container(
                              width: 100,
                              child: TextField(
                                controller: _cntMname,
                                //enabled: _isEnable,
                                decoration: InputDecoration(
                                    hintText: mName.toString()
                                ),
                              ),
                            ),
                            IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  setState(() {
                                    _isEnable = true;
                                  });
                                })
                          ],
                        )),
                      ]),
                      DataRow(cells: [
//                DataCell(Text('10')),
                        DataCell(Text('Permanent Address')),
                        DataCell(Row(
                          children: <Widget>[
                            Container(
                              width: 100,
                              child: TextField(
                                controller: _cntPerAdd,
                                //enabled: _isEnable,
                                decoration: InputDecoration(
                                    hintText: perAdd.toString()
                                ),
                              ),
                            ),
                            IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  setState(() {
                                    _isEnable = true;
                                  });
                                })
                          ],
                        )),
                      ]),
                      DataRow(cells: [
//                DataCell(Text('15')),
                        DataCell(Text('present address')),
                        DataCell(Row(
                          children: <Widget>[
                            Container(
                              width: 100,
                              child: TextField(
                                controller: _cntPreAdd,
                                //enabled: _isEnable,
                                decoration: InputDecoration(
                                    hintText: preAdd.toString()
                                ),
                              ),
                            ),
                            IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  setState(() {
                                    _isEnable = true;
                                  });
                                })
                          ],
                        )),
                      ]),
                      DataRow(cells: [
//                DataCell(Text('15')),
                        DataCell(Text('Phone No')),
                        DataCell(Row(
                          children: <Widget>[
                            Container(
                              width: 100,
                              child: TextField(
                                controller: _cntPhone,
                                //enabled: _isEnable,
                                decoration: InputDecoration(
                                    hintText: phoneN.toString()
                                ),
                              ),
                            ),
                            IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  setState(() {
                                    _isEnable = true;
                                  });
                                })
                          ],
                        )),
                      ]),
                      DataRow(cells: [
//                DataCell(Text('15')),
                        DataCell(Text('Email')),
                        DataCell(Row(
                          children: <Widget>[
                            Container(
                              width: 100,
                              child: TextField(
                                controller: _cntEmail,
                                //enabled: false,//_isEnable,
                                decoration: InputDecoration(
                                    hintText: email.toString()
                                ),
                              ),
                            ),
//                            IconButton(
//                                icon: Icon(Icons.edit),
//                                onPressed: () {
//                                  setState(() {
//                                    _isEnable = true;
//                                  });
//                                })
                          ],
                        )),
                      ]),
                      DataRow(cells: [
//                DataCell(Text('15')),
                        DataCell(Text("")),
                        DataCell(Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: ElevatedButton.icon(
                              onPressed: () async {
                                print(_cntPreAdd.text+"...........oknot.............");
                                final userS=await _firebaseAuth.currentUser;
                                await _firestore
                                    .collection('teacher user')
                                    .doc(userS!.uid)
                                    .set({
                                  "Name": userS.displayName.toString(),
                                  "Email": userS.email.toString(),
                                  "phoneNumber": _cntPhone.text,
                                  "status": "Unavialable",
                                  "uid": userS.uid.toString(),
                                  "Father's name":_cntFname.text,
                                  "Mother's name":_cntMname.text,
                                  "Permanent Address":_cntPerAdd.text,
                                  "present Address":_cntPreAdd.text,

                                });
                                getProfile();
                              },
                              icon: Icon(Icons.send_and_archive_outlined),
                              label: Text(
                                "Submit",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              )),
                        )),
                      ])
                    ],
                  ),
                ]),
              ),
            ],
          )),
    );
  }
}
