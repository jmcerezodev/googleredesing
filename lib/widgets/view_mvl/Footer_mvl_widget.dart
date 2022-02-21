import 'package:flutter/material.dart';
import 'package:nuevoestilogoogle/providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterMvl extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            bntUp(context),
            btnBottom(context),
          ],
        ),
      ),
    );
  }
}

Widget bntUp(BuildContext context) {

  final localizations = Provider.of<LocalizationsProvider>(context);
  List<String> _locations = ['ES', 'EN'];

  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            Icons.info,
            color: Theme.of(context).hintColor,
          ),
          onPressed: () => launch('https://www.google.com/search/howsearchworks/?fg=1'),
        ),
        IconButton(
          icon: Icon(
            Icons.settings,
            color: Theme.of(context).hintColor,
          ),
          onPressed: () => launch('https://www.google.es/preferences?hl=es&fg=1'),
        ),
        SizedBox(width: 20),
        Container(
          height: 40,
          child: DropdownButton(
            underline: Container(),
            value: localizations.language,
            style: TextStyle(decoration: TextDecoration.none),
            items: _locations.map((String a){
              return DropdownMenuItem(
                value: a,
                child: Text(
                  a == 'ES' ? 'Español' : 'English',
                  style: TextStyle(
                    fontFamily: 'Google',
                    color: Theme.of(context).hintColor,
                  ),
                ),
              );
          }).toList(),
            onChanged: (value){
              localizations.languagee = value.toString();
            },
          ),
        ),
      ],
    ),
  );
}

Widget btnBottom(BuildContext context){

  final size = MediaQuery.of(context).size;

  return Container(
    width: size.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          child: Text(
            'Privacidad',
            style: TextStyle(
              fontFamily: 'Google',
              color: Theme.of(context).hintColor,
            ),
          ),
          onPressed: () => launch('https://policies.google.com/privacy?hl=es&fg=1'),
        ),
        TextButton(
          child: Text(
            'Condiciones',
            style: TextStyle(
              fontFamily: 'Google',
              color: Theme.of(context).hintColor
            ),
          ),
          onPressed: () => launch('https://policies.google.com/terms?hl=es&fg=1'),
        ),
        TextButton(
          child: Text(
            'Preferencias',
            style: TextStyle(
              fontFamily: 'Google',
              color: Theme.of(context).hintColor,

            ),
          ),
          onPressed: () => launch('https://www.google.es/preferences?hl=es&fg=1',),
        ),
      ],
    ),
  );
}
