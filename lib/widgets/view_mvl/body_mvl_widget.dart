import 'package:flutter/material.dart';
import 'package:nuevoestilogoogle/providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class BodyMvl extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      child: Column(
        children: [
          titleGoogle(),
          SizedBox(height: 50),
          searchBar(context),
          SizedBox(height: 75),
          googleAsistente(context),
          SizedBox(height: 20),
          iconsBody(),

        ],
      ),
    );
  }
}

Widget titleGoogle(){
  return RichText(
    text: TextSpan(
      children: [

        textSpan('G', Colors.blue),
        textSpan('o', Colors.red),
        textSpan('o', Colors.orangeAccent),
        textSpan('g', Colors.blue),
        textSpan('l', Colors.green),
        textSpan('e', Colors.red),



      ]
    ),
  );
}

TextSpan textSpan(String letra, Color color){
  return TextSpan(
    text: letra,
    style: TextStyle(
      fontFamily: 'Google',
      color: color,
      fontSize: 50
    ),
  );
}

Widget searchBar(BuildContext context){

  final changeTheme = Provider.of<ChangeTheme>(context);

  return Container(
    width: 400,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 300,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: changeTheme.isDark ? Color(0xff333333) : Color(0xffEDEDED),
              borderRadius: BorderRadius.circular(20)
          ),
          
          child: textFieldBody(context),
        ),


      ],
    ),
  );
}

Widget btnBuscar(BuildContext context) {

  final search = Provider.of<Search>(context);

  return IconButton(
    icon: Icon(Icons.search, color: Colors.blue, size: 30),
    onPressed: (){
      launch('https://www.google.com/search?q=${search.valueSearchBar}');
    },
  );
}

Widget googleAsistente(BuildContext context){

  return Container(
    child: Column(
      children: [

        MaterialButton(
          child: Image(
            image: AssetImage('lib/images/google-voice.png'),
            width: 50,
          ),
          onPressed: (){},
        ),

        SizedBox(height: 25),
        Text(
          'Tu asistente de voz...',
          style: TextStyle(
            fontFamily: 'Google',
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
        ),
        Text(
          'Prueba diciendo algo',
          style: TextStyle(
            fontFamily: 'Google',
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
      ],
    ),
  );

}

Widget textFieldBody(BuildContext context){

  final search = Provider.of<Search>(context);
  final changeTheme = Provider.of<ChangeTheme>(context);

  return TextField(
    cursorHeight: 24,
    decoration: InputDecoration(
      icon: btnBuscar(context),
      border: InputBorder.none,
      hintText: 'Buscar con Google',
      hintStyle: TextStyle(
        color: Colors.grey
      ),
    ),
    style: TextStyle(
      color: changeTheme.isDark ? Colors.white : Colors.black,
    ),


    onChanged: (value){
      search.valueSearchBar = value;
    },
  );
}

Widget iconsBody(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [

      imgIconos('https://cdn-icons-png.flaticon.com/512/174/174883.png','https://www.youtube.com/'),

      imgIconos('https://cdn-icons-png.flaticon.com/512/5968/5968534.png','https://mail.google.com/'),

      imgIconos('https://cdn-icons-png.flaticon.com/512/5968/5968523.png','https://drive.google.com/'),

      imgIconos('https://cdn-icons-png.flaticon.com/512/5968/5968552.png','https://meet.google.com/'),

      imgIconos('https://cdn-icons-png.flaticon.com/512/281/281759.png','https://translate.google.es/'),

    ],
  );
}

Widget imgIconos(String urlIcono, String url) {
  return Container(
    width: 55,
    child: MaterialButton(
      child: Image(
        width: 50,
        image: NetworkImage(urlIcono),
      ),
      onPressed: (){
        launch(url);
      },
    ),
  );
}
