import 'package:flutter/material.dart';
import 'package:nuevoestilogoogle/views/mvl_view.dart';
import 'package:nuevoestilogoogle/views/pc_view.dart';




    class HomePage  extends StatelessWidget {

      @override
      Widget build(BuildContext context) {

        final size = MediaQuery.of(context).size;

        return Scaffold(
          body: size.width > 800 ? PcView() : MvlView(),
        );
      }
    }



