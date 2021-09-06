import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateRoutine extends StatefulWidget {
  @override
  _UpdateRoutineState createState() => _UpdateRoutineState();
}

class _UpdateRoutineState extends State<UpdateRoutine> {

  TextEditingController _cntTime1 =TextEditingController();

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
  void initState() {
    // TODO: implement initState
    super.initState();
    getRoutine();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Edit Routine")),
      ),
      body: Container(
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
                    Text("Class Routine",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text("DepartMent: Computer Science and Engineering",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text("Semister:Fall,2021",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                              label: Row(
                                children: <Widget>[
                                  Container(
                                    width: 100,
                                    child: TextField(
                                      controller: _cntTime1,
                                      //enabled: true,//_isEnable,
                                      decoration: InputDecoration(
                                          labelText: "$time1"//name.toString()//_firebaseAuth.currentUser!.displayName.toString()
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
                    ElevatedButton(
                        onPressed: (){

                        },
                        child: Text("Update")
                    )
                  ],
                );
              },
            )),
      )
//      Container(
//        height: MediaQuery.of(context).size.height,
//        width: MediaQuery.of(context).size.width,
//        color: Colors.white,
//        child: Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: Center(
//              child: ListView(children: <Widget>[
//                Container(
//                  //color: Colors.black12,
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: [
//                      Text("Class Routine",
//                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                      ),
//                      Text("DepartMent: Computer Science and Engineering",
//                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                      ),
//                      Text("Semister:Fall,2021",
//                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                      ),
//                    ],
//                  ),
//                ),
//                DataTable(
//                  columns: [
////              DataColumn(label: Text(
////                  'ID',
////                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
////              )),
//                    DataColumn(
//                        label: Text(
//                          "Day",
//                          //style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
//                        )),
//                    DataColumn(
//                        label: Text(
//                          time1.toString(),
//                          //style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
//                        )),
//                    DataColumn(
//                        label: Text(
//                          time2.toString(),
//                          //style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
//                        )),
//                    DataColumn(
//                        label: Text(
//                          "$time3.toString()",
//                          //style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
//                        )),
//                  ],
//                  rows: [
//                    DataRow(cells: [
////                DataCell(Text('15')),
//                      DataCell(Text(day1.toString())),
//                      DataCell(Text(sub1.toString()+"\n"+t1.toString()+"\n"+r1.toString())),
//                      DataCell(Text(sub2.toString()+"\n"+t1.toString()+"\n"+r1.toString())),
//                      DataCell(Text(sub1.toString()+"\n"+t1.toString()+"\n"+r1.toString())),
//                    ]),
//                    DataRow(cells: [
////                DataCell(Text('1')),
//                      DataCell(Text(day2.toString())),
//                      DataCell(Text(sub2.toString()+"\n"+t2.toString()+"\n"+r2.toString())),
//                      DataCell(Text(sub2.toString()+"\n"+t1.toString()+"\n"+r1.toString())),
//                      DataCell(Text(sub1.toString()+"\n"+t1.toString()+"\n"+r1.toString())),
//                    ]),
//                    DataRow(cells: [
////                DataCell(Text('5')),
//                      DataCell(Text(day3.toString())),
//                      DataCell(Text(sub3.toString()+"\n"+t3.toString()+"\n"+r3.toString())),
//                      DataCell(Text(sub2.toString()+"\n"+t1.toString()+"\n"+r1.toString())),
//                      DataCell(Text(sub1.toString()+"\n"+t1.toString()+"\n"+r1.toString())),
//                    ]),
//
//                  ],
//                ),
//              ]),
//            )),
//      ),
    );
  }
}
