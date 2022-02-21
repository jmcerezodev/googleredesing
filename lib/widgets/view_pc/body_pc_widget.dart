import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:nuevoestilogoogle/providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class BodyPc extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          titleGoogle(context),
          SizedBox(height: 50),
          searchBar(context),
          SizedBox(height: 50),
          iconsBody(),

        ],
      ),
    );
  }
}

Widget titleGoogle(BuildContext context){
  
  final hoverTitle = Provider.of<HoverTitle>(context);
  
  return MouseRegion(
    onEnter: (_){
      hoverTitle.isHover = true;
      print(hoverTitle.isHover);
      },
    onExit: (_) {
      hoverTitle.isHover = false;
      print(hoverTitle.isHover);
    },
    child: hoverTitle.isHover == true ? AnimatedTextKit(
            repeatForever: true,

            animatedTexts: [
              WavyAnimatedText(
                'Google',
                textStyle: TextStyle(fontSize: 120, fontFamily: 'Google'),
              ),
            ],
          )
        : RichText(
            text: TextSpan(
              children: [
                textSpan('G', Colors.blue),
                textSpan('o', Colors.red),
                textSpan('o', Colors.orangeAccent),
                textSpan('g', Colors.blue),
                textSpan('l', Colors.green),
                textSpan('e', Colors.red),
              ],
            ),
          ),
  );

}

TextSpan textSpan(String letra, Color color){
  return TextSpan(
    text: letra,
    style: TextStyle(
      fontFamily: 'Google',
      color: color,
      fontSize: 120
    ),
  );
}

Widget searchBar(BuildContext context){

  final changeTheme = Provider.of<ChangeTheme>(context);

  return BounceInUp(
    delay: Duration(milliseconds: 500),
    child: Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
            width: 600,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: changeTheme.isDark ? Color(0xff333333) : Color(0xffEDEDED),
                borderRadius: BorderRadius.circular(20)
            ),

            child: textFieldBody(context),
          ),

        ],
      ),
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        MaterialButton(
          child: Image(
            image: AssetImage('lib/images/google-voice.png'),
            width: 30,
          ),
          onPressed: (){},
        ),

      ],
    ),
  );

}

Widget textFieldBody(BuildContext context){

  final search = Provider.of<Search>(context);

  return TextField(
    autofocus: true,
    cursorHeight: 24,
    decoration: InputDecoration(
      icon: btnBuscar(context),
      suffixIcon: googleAsistente(context),
      border: InputBorder.none,
      hintText: 'Buscar con Google',
      hintStyle: TextStyle(
        color: Colors.grey
      ),
    ),
    onChanged: (value){
      search.valueSearchBar = value;
    },
  );
}

Widget iconsBody(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

      imgIconos('https://cdn-icons-png.flaticon.com/512/174/174883.png','https://www.youtube.com/'),
      SizedBox(width: 20),
      imgIconos('https://cdn-icons-png.flaticon.com/512/5968/5968534.png','https://mail.google.com/'),
      SizedBox(width: 20),
      imgIconos('https://cdn-icons-png.flaticon.com/512/5968/5968523.png','https://drive.google.com/'),
      SizedBox(width: 20),
      imgIconos('https://cdn-icons-png.flaticon.com/512/5968/5968552.png','https://meet.google.com/'),
      SizedBox(width: 20),
      imgIconos('https://cdn-icons-png.flaticon.com/512/281/281759.png','https://translate.google.es/'),

    ],
  );
}

Widget imgIconos(String urlIcono, String url) {
  return Container(
    width: 50,
    //color: Colors.blue,
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
