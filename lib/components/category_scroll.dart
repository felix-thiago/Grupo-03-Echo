import 'package:flutter/material.dart';

class CategoryScroll extends StatelessWidget {
  const CategoryScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Container(
        height: 80,
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            );
          },
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 6,
          itemBuilder: (ctx, indice) {
            return SizedBox(
              width: 50,
              height: 50,
              child: Column(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(images[indice]),
                          opacity: 0.9,
                          alignment: Alignment.bottomRight,
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      // border: Border.all(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Text(
                      category[indice],
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

List category = [
  "Marcas",
  "Acessório",
  "Percussão",
  "Cordas",
  "Sopro",
  "Teclas"
];

List images = [
  "assets/images/tag.png",
  "assets/images/mic.png",
  "assets/images/drum.png",
  "assets/images/guitar.png",
  "assets/images/trumpet.png",
  "assets/images/piano.png",
];
