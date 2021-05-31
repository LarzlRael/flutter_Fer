import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/modes/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;

  CardSwiper({@required this.peliculas});
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    print(_screenSize);
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              image: NetworkImage(peliculas[index].getPosterImg()),
              placeholder: NetworkImage(
                  'https://www.escapeauthority.com/wp-content/uploads/2116/11/No-image-found.jpg'),
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: 3,
        /* pagination: new SwiperPagination(),
        control: new SwiperControl(), */
      ),
    );
  }
}
