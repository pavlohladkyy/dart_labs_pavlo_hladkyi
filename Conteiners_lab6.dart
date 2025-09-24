import 'package:flutter/material.dart';

BoxDecoration customBox(Color color) => BoxDecoration(
  color: color,
  border: Border.all(color: Colors.black, width: 2),
  boxShadow: const [
    BoxShadow(color: Colors.black26, offset: Offset(2, 2), blurRadius: 2),
  ],
);

class Lab6Layout extends StatelessWidget {
  const Lab6Layout({super.key});

  static const double j = 750;
  static const double m = 500;
  static const double b = 250;
  static const double f = 150;
  static const double g = 450;
  static const double h = 500;
  static const double d = 150;
  static const double i = 100;
  static const double n = 5;
  static const double r = 6;
  static const double p = 4;
  static const double s = 3;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: j,
        height: m,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Stack(
          children: [
            Positioned(
              left: n,
              top: b,
              child: Container(
                width: g,
                height: f,
                decoration: customBox(Colors.yellow),
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'Ще не вмерла Україна, і слава, і воля, ще нам, браття',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Positioned(
              left: g + n + r,
              top: b,
              child: Container(
                width: h,
                height: f,
                decoration: customBox(Colors.lightBlueAccent),
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'Згинуть наші вороженьки, як роса на сонці, '
                  'запануєм і ми, браття, у своїй сторонці.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Positioned(
              left: g + n + r + h + p,
              top: b + f + s,
              child: Container(
                width: i,
                height: d,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 2),
                ),
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'І покажем, що ми, браття, козацького роду.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
