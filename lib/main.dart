import 'package:carcovid/ui/home/home.dart';
import 'package:carcovid/ui/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'theme/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('es'),
        const Locale.fromSubtags(
            languageCode: 'es'), 
            // Spanish *See Advanced Locales below*
      ],
      title: 'CarCovid App',
      home: ChangeNotifierProvider(create: (_) => HomeBloc(), child: Home()),
    );
  }
}
