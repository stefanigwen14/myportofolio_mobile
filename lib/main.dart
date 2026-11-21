import 'package:flutter/material.dart' hide TextTheme;
import 'package:myportofolio_mobile/screens/menu.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSeed(
          primary: const Color(0xFFDDBEBE),
          seedColor: const Color(0xFFFFF5EA),
          secondary: const Color(0xFF574C45),
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}