import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentmanagementsystem/screen/student/drawerNag.dart';

class Student_page extends StatefulWidget {
  String? status;
  Student_page(String? status){
    this.status=status;
  }
  @override
  _Student_pageState createState() => _Student_pageState(status);
}

class _Student_pageState extends State<Student_page> {
  String? status;
  _Student_pageState(String? status){
    this.status=status;
  }
  TextEditingController _cntName = TextEditingController(text: "Gunjon Roy");
  TextEditingController _cntFname = TextEditingController(text: "Dilip Roy");
  TextEditingController _cntMname = TextEditingController(text: "Mollika Roy");
  TextEditingController _cntPerAdd = TextEditingController(text: "Rangpur");
  TextEditingController _cntPreAdd = TextEditingController(text: "Dhaka");
  TextEditingController _cntPhone = TextEditingController(text: "01766609988");
  TextEditingController _cntEmail = TextEditingController(text: "gunjon.cse@gmail.com");
  //TextEditingController _cntName = TextEditingController();
  bool _isEnable = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Student Portal")),
        ),
        drawer: Drawerneg(),
        body: _build_Body(status)

      ),
    );
  }
  Widget _build_Body(String? status){
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(status=="p")...[
              _build_ShowProfile()
            ]
            else if(status=="r")...[
              _build_ShowResult()
            ]
            else if(status=="cr")...[
                _build_ChatRoom()
              ]
              else if(status=="ocr")...[
                  _build_OnlineClassRoom()
                ]
                else if(status=="nb")...[
                    _build_NoticeBoard()
                  ]
                  else if(status=="cr")...[
                      _build_ChatRoom()
                    ]
                    else if(status=="hw")...[
                        _build_HomeWork()
                      ]
                      else if(status=="a")...[
                          _build_Assignment()
                        ]
                        else if(status=="up")...[
                            _build_UpdateProfile()
                          ]
          ],
        ),
      ),
    );
  }
  Widget _build_ShowProfile(){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: <Widget>[
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
              DataColumn(label: Text(
                  'Name',
                  //style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
              )),
              DataColumn(label: Text(
                  'Profession',
                  //style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
              )),
            ],
            rows: [
              DataRow(cells: [
//                DataCell(Text('15')),
                DataCell(Text('profile pic')),
                DataCell(CircleAvatar(
                  backgroundImage: AssetImage("images/gunjon.png"),
                  radius: 30,
                  //child: Text("Profile"),
                ),),
              ]),
              DataRow(cells: [
//                DataCell(Text('1')),
                DataCell(Text("father's Name")),
                DataCell(Row(
                  children: <Widget>[
                    Container(
                      width: 100,
                      child: TextField(
                        controller: _cntName,
                        enabled: _isEnable,
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
                ),),
              ]),
              DataRow(cells: [
//                DataCell(Text('5')),
                DataCell(Text("Mother's Name")),
                DataCell(Text('Mollika Roy')),
              ]),
              DataRow(cells: [
//                DataCell(Text('10')),
                DataCell(Text('Permanent Address')),
                DataCell(Text('Rangpur')),
              ]),
              DataRow(cells: [
//                DataCell(Text('15')),
                DataCell(Text('present address')),
                DataCell(Text('Dhaka')),
              ]),
              DataRow(cells: [
//                DataCell(Text('15')),
                DataCell(Text('Phone No')),
                DataCell(Text('01766609988')),
              ]),
              DataRow(cells: [
//                DataCell(Text('15')),
                DataCell(Text('Email')),
                DataCell(Text('gunjon.cse@gmail.com')),
              ]),

            ],
          ),
        ])
      ),
    );
  }
  Widget _build_ShowResult(){
    return Container(

    );
  }
  Widget _build_EditProfile(){
    return Container(

    );
  }
  Widget _build_ClassRoutine(){
    return Container(

    );
  }
  Widget _build_OnlineClassRoom(){
    return Container(

    );
  }
  Widget _build_NoticeBoard(){
    return Container(

    );
  }
  Widget _build_ChatRoom(){
    return Container(

    );
  }
  Widget _build_HomeWork(){
    return Container(

    );
  }
  Widget _build_Assignment(){
    return Container(

    );
  }
  Widget _build_UpdateProfile(){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                DataColumn(label: Text(
                  'Name',
                  //style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                )),
                DataColumn(label: Row(
                  children: <Widget>[
                    Container(
                      width: 100,
                      child: TextField(
                        controller: _cntName,
                        enabled: _isEnable,
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
              ],
              rows: [
                DataRow(cells: [
//                DataCell(Text('15')),
                  DataCell(Text('profile pic')),
                  DataCell(CircleAvatar(
                    backgroundImage: AssetImage("images/gunjon.png"),
                    radius: 30,
                    //child: Text("Profile"),
                  ),),
                ]),
                DataRow(cells: [
//                DataCell(Text('1')),
                  DataCell(Text("father's Name")),
                  DataCell(Row(
                    children: <Widget>[
                      Container(
                        width: 100,
                        child: TextField(
                          controller: _cntFname,
                          enabled: _isEnable,
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
                  ),),
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
                          enabled: _isEnable,
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
                          enabled: _isEnable,
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
                          enabled: _isEnable,
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
                          enabled: _isEnable,
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
                          enabled: _isEnable,
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

              ],
            ),
          ])
      ),
    );
  }
}
