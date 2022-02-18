import 'package:flutter/material.dart';
import 'package:nuevoestilogoogle/pages/home_page.dart';
import 'package:nuevoestilogoogle/providers/providers.dart';
import 'package:provider/provider.dart';


void main() => runApp(StateProvider());


class StateProvider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChangeTheme()),
        ChangeNotifierProvider(create: (_) => Search()),

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
        title: 'New Style Google',
        routes: Routes.routes,
        initialRoute: 'home',
        theme: changeTheme.theme
    );
  }
}

class Routes {
  static final routes = {

    'home' : (_) => HomePage(),

  };
}



