import 'package:flutter/material.dart';
//Vamos reutilizar este widget

class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, //ancho de la pantalla
      height: 500,
      color: Colors.red,
    );
  }
}
