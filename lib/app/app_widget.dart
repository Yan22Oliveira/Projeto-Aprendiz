import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import './shared/shared.dart';
import './modulos/modulos.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);
  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([]);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppLocale(),
        ),
        ChangeNotifierProvider(
          create: (_) => CreateChurchController(),
        ),
        ChangeNotifierProvider(
          create: (_) => CreateProjetoController(),
        ),
      ],
      child: Consumer<AppLocale>(
        builder: (context, locale, child){
          return MaterialApp(
            title: 'Projeto Aprendiz',
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''),
              Locale('pt', ''),
              Locale.fromSubtags(languageCode: 'zh'),
            ],
            locale: locale.locale,
            theme: AppThemeData.themeData,
          ).modular();
        },
      ),
    );
  }
}
