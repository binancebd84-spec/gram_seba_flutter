import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/theme/app_theme.dart';
import 'routes.dart';

class GramSebaApp extends StatelessWidget {
  const GramSebaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'গ্রাম সেবা',
      theme: AppTheme.lightTheme.copyWith(
        textTheme: GoogleFonts.hindSiliguriTextTheme(),
      ),
      initialRoute: AppRoutes.intro,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}