import 'package:basti_intern_task/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const NGOApp());
}

class NGOApp extends StatelessWidget {
  const NGOApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basti Ki Pathshala',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: GoogleFonts.poppinsTextTheme(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}