import 'package:flutter/material.dart';
import 'package:subhash_app/view/login_page.dart';
import 'package:subhash_app/view_model/stationery_controller.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => StationeryController()),
        ],
        child: MaterialApp(
          home: LoginPage(),
        ));
  }
}
