import 'package:flutter/material.dart';
import 'screen/admin/admin_page.dart';
import 'screen/home_page.dart';
import 'screen/log_in_page.dart';
import 'screen/registration_page.dart';
import 'screen/student/student_page.dart';
import 'screen/teacher/teacher_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        //'/reg':(_)=>RegistrationPage(),
        //'/log':(_)=>LogInPage(),
        '/home':(_)=>HomePage(),
        '/techer':(_)=>TeacherPage("p"),
        //'/student':(_)=>Student_page(),
        //'/admin':(_)=>AdminPage(),
        '/admin':(_)=>AdminPage(),
      },
    );
  }
}

