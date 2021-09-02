import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../authService/AuthService.dart';
import 'home_page.dart';
//import '..';
import 'log_in_page.dart';

//final auth=FirebaseAuth.instance;
class RegistrationPage extends StatefulWidget {
  late final bool who;
  RegistrationPage(bool who){
    this.who=who;
  }
  @override
  _RegistrationPageState createState() => _RegistrationPageState(who);
}

class _RegistrationPageState extends State<RegistrationPage> {

  late final bool who;
  _RegistrationPageState(bool who){
    this.who=who;
  }
  final auth=FirebaseAuth.instance;
  String firstName="";
  String lastName="";
  String email="";
  String passFirst="";
  String passSecound="";

  String phoneNo ="";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 80),
            child: Text("Registration"),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height*1,
              width: MediaQuery.of(context).size.width*1,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black12
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20,left: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.account_circle),
                            hintText: "First Name"
                          ),
                          onChanged: (value){
                            setState(() {
                              firstName=value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 60,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black12
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.account_circle),
                            hintText: "Last Name"
                          ),
                          onChanged: (value){
                            setState(() {
                              lastName=value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 60,
                    width: 350,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black12
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20),
                        child: TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.account_circle),
                              hintText: "Phone No"
                          ),
                          onChanged: (value){
                            setState(() {
                              phoneNo=value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 60,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black12,
                    ),
                    child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20,left: 20),
                          child: TextField(
                            decoration:InputDecoration(
                                prefixIcon: Icon(Icons.mail_outline_rounded),
                                hintText: "Email"
                            ),
                            onChanged: (value){
                              setState(() {
                                email=value;
                              });
                            },
                          ),
                        )
                    ),

                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 60,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black12,
                    ),
                    child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: TextField(
                            //obscureText: true,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                hintText: "Enter password",
                                suffixIcon: Icon(Icons.visibility)
                            ),
                            onChanged: (value){
                              setState(() {
                                passFirst=value;
                              });
                            },
                          ),
                        )
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 60,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black12,
                    ),
                    child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: TextField(
                           // obscureText: true,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                hintText: "Re-Enter password",
                                suffixIcon: Icon(Icons.visibility)
                            ),
                            onChanged: (value){
                              setState(() {
                                passSecound=value;
                              });
                            },
                          ),
                        )
                    ),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                      onPressed: ()async{
                        try{
                          if(passFirst.toString()==passSecound.toString()){

                            AuthService().createUserWithEmailAndPassword(firstName+" "+lastName, email, passSecound, phoneNo,who);
//                            print("sdgfsdsdfsdfsdf");
//                            await auth.createUserWithEmailAndPassword(
//                                email: email, password: passSecound);
//                            await FirebaseAuth.instance.currentUser!.updateDisplayName(firstName.toString()+lastName.toString());
//                            print("added");
                            //Navigator.push(context,MaterialPageRoute(builder: (context)=>LogInPage(who)));
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LogInPage(who)), (route) => false);
                          }
                          else{
                            print("Secound password not match please re enter");
                          }

                        }catch(e){

                        }

                      },
                      child: Text("Submit")
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
