import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';

class CarrouselCard extends StatelessWidget {
  const CarrouselCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: CarouselSlider(
        items: [
          Padding(
            padding: const EdgeInsets.fromLTRB(7, 0, 7, 0),
            child: Container(
              width: 800,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                    image: AssetImage('assets/images/foto1.png'),
                    opacity: 0.9,
                    alignment: Alignment.bottomRight,
                    fit: BoxFit.fill),
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 2),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(7, 0, 7, 0),
            child: Container(
              width: 800,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                    image: AssetImage('assets/images/foto2.png'),
                    opacity: 0.9,
                    alignment: Alignment.bottomRight,
                    fit: BoxFit.fill),
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 2),
              ),
            ),
          ),
        ],
        options: CarouselOptions(
          height: 150,
          enableInfiniteScroll: true,
          viewportFraction: 0.9,
        ),
      ),
    );
  }
}
/*
  teste
*/
