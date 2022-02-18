import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterPc extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: double.infinity,
      height: 50,
      //color: Colors.grey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          bntleft(context),
          btnRight(context),
        ],
      ),

    );
  }
}

Widget bntleft(BuildContext context) {

  List<String> _locations = ['Español'];

  return Container(
    child: Row(
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
            value: 'Español',
            style: TextStyle(decoration: TextDecoration.none),
            items: _locations.map((String a){
              return DropdownMenuItem(
                value: a,
                child: Text(
                  a,
                  style: TextStyle(
                    fontFamily: 'Google',
                    color: Theme.of(context).hintColor,
                  ),
                ),
              );
          }).toList(),
            onChanged: (value){

            },
          ),
        ),
      ],
    ),
  );
}

Widget btnRight(BuildContext context){
  return Container(
    child: Row(
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
