import 'package:flutter/material.dart';
import 'package:library_app/pages/login_page.dart';
import 'package:library_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context)
          .themeData, // Set the default light theme
      title: 'Book Buddy',
      home: LoginScreen(),
    );
  }
}
