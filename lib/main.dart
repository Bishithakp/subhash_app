import 'package:flutter/material.dart';
import 'package:subhash_app/view/login_page.dart';
import 'package:subhash_app/view_model/stationery_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StationeryController()),
      ],
      child:  MaterialApp(
        home: LoginPage(),
      
    ));
  }
}
