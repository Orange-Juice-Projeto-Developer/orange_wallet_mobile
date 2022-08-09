import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orange_wallet_mobile/pages/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:orange_wallet_mobile/pages/all_transactions_page.dart';

Future<void> main() async {
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
        appBarTheme: AppBarTheme(backgroundColor: Colors.grey.shade800),
        scaffoldBackgroundColor: Colors.black,
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.grey),
          fillColor: Color(0XFF383838),
          filled: true,
        ),
        cardColor: Colors.grey.shade600,
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
      routes: {
        '/': (_) => const HomePage(),
        '/listTransaction': (_) => const AllTransactionsPage(),
      },
    );
  }
}
