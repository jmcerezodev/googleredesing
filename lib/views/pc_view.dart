

import 'package:flutter/material.dart';
import 'package:nuevoestilogoogle/widgets/widgets.dart';

class PcView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.yellow,
      padding: EdgeInsets.only(top: 25,left: 50, right: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderPc(),
          BodyPc(),
          FooterPc(),
        ],
      ),
    );
  }
}
