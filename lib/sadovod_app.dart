import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sadovod/navigation/app_router.dart';

class SadovodApp extends StatelessWidget {
  SadovodApp({Key? key}) : super(key: key);

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router.config(),
      theme: ThemeData(
        useMaterial3: false,
        //textTheme: GoogleFonts.montserratTextTheme(),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          primary: Colors.green,
          secondary: Colors.white,
          surface: const Color(0x00f0f0f0),
        ),
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          bodySmall: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
