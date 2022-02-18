

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuevoestilogoogle/widgets/view_mvl/body_mvl_widget.dart';
import 'package:nuevoestilogoogle/widgets/widgets.dart';

class MvlView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: size.height * 0.95 ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              HeaderMvl(),
              BodyMvl(),
              FooterMvl(),

            ],
          ),
        ),
      ),
    );
  }
}
