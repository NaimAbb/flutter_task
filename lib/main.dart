import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/src/utils/constants.dart';
import 'package:flutter_task/src/views/screens/home_screen/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MaterialApp(
        theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        debugShowCheckedModeBanner: false,
        title: Constants.APP_NAME,
        home: const HomeScreen(),
      ),
    );
  }
}
