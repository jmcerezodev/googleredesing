import 'package:flutter/material.dart';
import 'package:nuevoestilogoogle/providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HeaderPc extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.black12,
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
    final _urlMap = 'https://www.google.es/maps/place/Espa%C3%B1a/@39.8769703,-12.6985822,5z/data=!4m5!3m4!1s0xc42e3783261bc8b:0xa6ec2c940768a3ec!8m2!3d40.463667!4d-3.74922?hl=es';

    return Container(
      child: Row(
        children: [
          MaterialButton(
            child: topButtonLeft(context ,Icons.storefront ,'Google Store'),
            onPressed: (){

              _launchURL(_urlStore);

            },
          ),
          Text('|'),
          MaterialButton(
            child: topButtonLeft(context ,Icons.location_on ,'España'),
            onPressed: (){
              _launchURL(_urlMap);
            },
          ),
        ],
      ),
    );

  }

  void _launchURL(String url) async {
    await launch(url);
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
          changeTheme.isDark ? Text('Light',style: TextStyle(fontFamily: 'Google'),) : Text('Dark',style: TextStyle(fontFamily: 'Google')),
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
      //color: Color(0xffEDEDED),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: changeTheme.isDark ? Color(0xff454545) : Color(0xffEDEDED),
              offset: Offset(0, 1), // changes position of shadow
            ),
          ]
        ),
        child: Row(
          children: [
            CircleAvatar(
              maxRadius: 14,
              backgroundImage: NetworkImage('https://previews.123rf.com/images/pandavector/pandavector1609/pandavector160900872/63731889-boy-icon-cartoon-single-avatar-peaople-icon-from-the-big-avatar-collection-.jpg'),
            ),
            SizedBox(width: 5,),
            Text('JM Cerezo'),
            SizedBox(width: 10,),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
      onPressed: (){},
    );

  }

  Widget topButtonLeft (BuildContext context, IconData icon,String text){
    return Container(
      child: Row(
        children: [
          Icon(
            icon,color: Colors.blue,

          ),
          SizedBox(width: 5,),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Google'
            ),
          ),
        ],
      ),
    );
  }
}
