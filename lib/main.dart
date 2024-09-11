import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localauth_example/screens/homescreen.dart';
import 'package:localauth_example/widgets/local%20auth%20gate/localauth.dart'; // Add this import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      title: 'ToDo App with Local Auth',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: LocalAuthScreen(), // Use LocalauthScreen as the home
    );
  }
}
