import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nuevoestilogoogle/pages/pages.dart';
import 'package:nuevoestilogoogle/providers/providers.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';


void main() => runApp(StateProvider());


class StateProvider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChangeTheme()),
        ChangeNotifierProvider(create: (_) => Search()),
        ChangeNotifierProvider(create: (_) => LocalizationsProvider()),

      ],
      child: MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final changeTheme = Provider.of<ChangeTheme>(context);
    

    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Nuevo Estilo Google',
        routes: Routes.routes,
        initialRoute: 'home',
        theme: changeTheme.theme,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}

class Routes {
  static final routes = {

    'home' : (_) => HomePage(),

  };
}



