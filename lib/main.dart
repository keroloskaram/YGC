import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gradprojec/contact-us.dart';
import 'package:gradprojec/enterresult.dart';
import 'package:gradprojec/facuilites.dart';
import 'package:gradprojec/finalmsg.dart';
import 'package:gradprojec/mainpage.dart';
import 'package:gradprojec/home.dart';
import 'package:gradprojec/universites.dart';
import 'splashscreen.dart';
import 'departments.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'contact-us.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      supportedLocales: const [Locale('ar')],
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ],
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      home: splashScreen(),
      onGenerateRoute: (settings) {
        if (settings.name == Faculty.routeName) {
          final args = settings.arguments as String;

          return MaterialPageRoute(
            builder: (context) {
              return Faculty(
                universityId: args,
              );
            },
          );
        }
        if (settings.name == department.routeName) {
          final argument = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) {
              return department(
                universityId: "1",
                collegeId: "3",
              );
            },
          );
        }
      },
      routes: {
        "home": (context) => home(),
        "main": (context) => mainpage(),
        "university": (context) => const University(),
        "result": (context) => result(),
        ContactUs.routeName: (context) => ContactUs(),
        finalmsg.routeName: (context) => finalmsg(),
      },
    );
  }
}
