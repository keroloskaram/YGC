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
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == Faculty.routeName) {
          return MaterialPageRoute(
            builder: (context) {
              return Faculty(
                argments: {'universityId': settings.arguments},
              );
            },
          );
        }
        if (settings.name == Department.routeName) {

         var universityId = settings.arguments.toString().split('universityId:')[1].split(',')[0].trim();
         var collegeId = settings.arguments.toString().split('collegeId:')[1].split('}')[0].trim();

          return MaterialPageRoute(
            builder: (context) {
              return Department(
                argments: {
                  'universityId': universityId,
                  'collegeId': collegeId,
                },
              );
            },
          );
        }
      },
      routes: {
        Home.routeName: (context) => Home(),
        Mainpage.routeName: (context) => Mainpage(),
        University.routeName: (context) => const University(),
        Result.routeName: (context) => Result(),
        ContactUs.routeName: (context) => ContactUs(),
        finalmsg.routeName: (context) => finalmsg(),
      },
    );
  }
}
