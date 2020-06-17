import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_sus/pages/home/home_page.dart';
import 'package:form_sus/pages/notificacao/registro_notificacao_page.dart';
import 'package:form_sus/theme/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Form SUS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: kPrimary1,
        snackBarTheme: SnackBarThemeData(
          actionTextColor: Theme.of(context).scaffoldBackgroundColor,
          backgroundColor: Colors.red,
          contentTextStyle:
              TextStyle(color: Theme.of(context).scaffoldBackgroundColor),
        ),        
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/create-registro': (context) => RegistroNotificacaoPage(),
      },
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
    const Locale('en'), // English
    const Locale('pt', 'BR'), //Brasil 
  ],
    );
  }
}
