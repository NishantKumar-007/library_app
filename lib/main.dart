import 'package:flutter/material.dart';
import 'package:library_app/pages/login_page.dart';
import 'package:library_app/providers/locale_provider.dart';
import 'package:library_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocaleProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(builder: (context, localeProvider, _) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: localeProvider.selectedLocale,
        supportedLocales: [
          Locale('en'),
          Locale('es'),
        ],
        theme: Provider.of<ThemeProvider>(context).themeData,
        title: 'Book Buddy',
        home: LoginScreen(),
      );
    });
  }
}
