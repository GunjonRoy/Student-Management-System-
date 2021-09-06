import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:studentmanagementsystem/screen/admin/admin_page.dart';
import 'package:studentmanagementsystem/screen/student/student_page.dart';
import '../authService/AuthService.dart';
import 'registration_page.dart';

class LogInPage extends StatefulWidget {
  late final bool who;
  LogInPage(bool who){
    this.who=who;
  }
  @override
  _LogInPageState createState() => _LogInPageState(who);
}

class _LogInPageState extends State<LogInPage> {
  late final bool who;
  _LogInPageState(bool who){
    this.who=who;
  }
  final auth=FirebaseAuth.instance;

  var email;

  var password;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 80),
            child: Text("Log In"),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
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
                    width: 350,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/student.png"),

                        )
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 60,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white30,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20,left: 20),
                        child: TextField(
                          onChanged: (value){
                            email=value;
                          },
                          decoration:InputDecoration(
                            prefixIcon: Icon(Icons.mail_outline),
                            hintText: "Email"
                          ),
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
                      color: Colors.white30,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            hintText: "password",
                            suffixIcon: Icon(Icons.visibility_off)
                          ),
                          onChanged: (value){
                            password=value;
                          },
                        ),
                      )
                    ),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                      onPressed: ()async{
                        setState(() async{
                          try{
                            if(email!="admin@a.com"){
                              await AuthService().signInWithEmailAndPassword(email, password).then((value) => print("Signed in"));
//                            await auth.signInWithEmailAndPassword(email: email, password: password);

                              if(who==true){
                                Navigator.pushNamed(context, '/techer');
                              }else if(who==false){
                                //Navigator.pushNamed(context, '/student');
                                //Navigator.push(context, MaterialPageRoute(builder: (context)=>Student_page("p")));
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Student_page("p")), (route) => false);
                              }
                              else{
                                Navigator.pushNamed(context, '/admin');
                              }
                            }
                            else{
                              await AuthService().signInWithEmailAndPassword(email, password).then((value) => print("Signed in"));
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>AdminPage()), (route) => false);
                            }
                            //Navigator.pushNamed(context, '/admin');
                          }catch(e){
                            print(e);
                          }
                        });

                      },
                      child: Text("Log In")
                  ),
                  SizedBox(height: 20,),
                  TextButton(
                      onPressed: (){
                        print(who);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationPage(who)));
                      },
                      child: Text("Or Registration",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      )
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
