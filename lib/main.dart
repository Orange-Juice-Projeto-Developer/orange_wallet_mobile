import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orange_wallet_mobile/pages/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      title: 'Orange Wallet',
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.white),
          fillColor: Color(0XFF383838),
          filled: true,
        ),
        cardColor: Colors.grey,
        textTheme: const TextTheme(
          subtitle1: TextStyle(),
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          decorationColor: Colors.white,
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        backgroundColor: Colors.black,
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0XFFFF8A00),
        ),
      ),
      home: const HomePage(),
    );
  }
}
