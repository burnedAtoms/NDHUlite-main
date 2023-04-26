import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'ui/pages/auth_page.dart';
import 'ui/theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "NDHUlite Login",
      theme: Themes.light,
      darkTheme: Themes.dark,
      //themeMode: ThemeService().theme,
      home: Scaffold(body: AuthPage(),),
    );
  } // Widget build...
}
