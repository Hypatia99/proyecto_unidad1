import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
//Vamos reutilizar este widget

class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    final size =
        MediaQuery.of(context).size; //almacenas el tamaño de la pantalla
    return Container(
      width: double.infinity, //para que el contenedor sera el ancho de pantalla
      height: size.height * 0.5,
      child: Swiper(
          itemCount: 10,
          layout: SwiperLayout.STACK, //forma en que se comporta
          itemWidth: size.width * 0.5,
          itemHeight: size.height * 0.4,
          itemBuilder: (_, int index) {
            return GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, 'details', arguments: ''),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    20), //Para hacer las esquinas redondeadas
                child: const FadeInImage(
                  placeholder: AssetImage('assets/camarita.jpg'),
                  image: NetworkImage('https://via.placeholder.com/300x400'),
                ),
              ),
            );
          }),
    );
  }
}
