import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Log In")),
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
                        ),
                      )
                    ),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                      onPressed: (){
                        Navigator.pushNamed(context, '/admin');
                      },
                      child: Text("Log In")
                  ),
                  SizedBox(height: 20,),
                  TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, '/reg');
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
