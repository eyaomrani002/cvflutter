import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/l10n.dart';
import 'splash_screen.dart'; // Import your SplashScreen file
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        // Your app's theme
      ),
      //changer la  langage
      supportedLocales:L10n.all,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,//
        GlobalWidgetsLocalizations.delegate,//
        GlobalCupertinoLocalizations.delegate,//make right if it from the left to the right
      ],
      //locale:Locale('en'),
      /*supportedLocales: [
        Locale('en'),
        Locale('fr')
      ],*/


      //au niveau ou lequelle je veux faire la traduction
      //Text(AppLocalizations.of(context).helloWord
      //fin ici
      home: SplashScreen(), // Set SplashScreen as the home screen

    );

  }
}
