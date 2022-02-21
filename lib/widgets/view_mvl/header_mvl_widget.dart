import 'package:flutter/material.dart';
import 'package:nuevoestilogoogle/providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HeaderMvl extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          btnsLeft(context),
          btnsRigh(context)

        ],
      ),
    );
  }

  Widget btnsLeft(BuildContext context) {

    final _urlStore = 'https://store.google.com';

    return Container(
      margin: EdgeInsets.only(left: 5),
      child: Row(
        children: [
          IconButton(
            splashRadius: 20,
            icon: Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/512/300/300221.png')),
            onPressed: () => launch(_urlStore),
          ),

        ],
      ),
    );

  }

  Widget btnsRigh(BuildContext context){

    return Container(
      child: Row(
      children: [

        btnSwitch(context),
        SizedBox(width: 20,),
        btnAcount(context),

        ],
      ),
    );
}

  Widget btnSwitch(BuildContext context){

    final changeTheme = Provider.of<ChangeTheme>(context);

    return Container(
      child: Row(
        children: [
          Icon(Icons.nightlight_round),
          Switch(
            value: changeTheme.isDark,
            onChanged: (value){
              changeTheme.isDark = value;
            },
          ),
        ],
      ),
    );
}

  Widget btnAcount(BuildContext context){

    final changeTheme = Provider.of<ChangeTheme>(context);

    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: changeTheme.isDark ? Color(0xff161D29) : Color(0xffEDEDED),
              offset: Offset(0, 1), // changes position of shadow
            ),
          ]
        ),
        child: Row(
          children: [
            CircleAvatar(
              maxRadius: 12,
              backgroundImage: NetworkImage('https://previews.123rf.com/images/pandavector/pandavector1609/pandavector160900872/63731889-boy-icon-cartoon-single-avatar-peaople-icon-from-the-big-avatar-collection-.jpg'),
            ),
            SizedBox(width: 5,),
            Text('JM Cerezo'),
            SizedBox(width: 5,),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
      onPressed: (){},
    );

  }


}
