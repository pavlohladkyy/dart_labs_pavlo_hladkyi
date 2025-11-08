import 'package:flutter/material.dart';

BoxDecoration customBox(Color color) => BoxDecoration(
  color: color,
  border: Border.all(color: Colors.black, width: 2),
  boxShadow: const [
    BoxShadow(color: Colors.black26, offset: Offset(2, 2), blurRadius: 2),
  ],
);

class Lab6Layout extends StatelessWidget {
  const Lab6Layout({Key? key}) : super(key: key);


  static const double a = 0;
  static const double b = 250;
  static const double c = 200;
  static const double d = 150;
  static const double g = 450;
  static const double h = 500;
  static const double f = 150;
  static const double i = 100;
  static const double k = 100;
  static const double m = 500;
  static const double n = 5;
  static const double p = 4;
  static const double r = 6;
  static const double s = 3;
  static const double j = 750;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Лабораторна робота 6'),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: j,
            height: m,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              color: Colors.grey[50],
            ),
            child: Stack(
              children: [

                Positioned(
                  left: n,
                  top: b - f,
                  child: Container(
                    width: g,
                    height: f,
                    decoration: customBox(Colors.yellow),
                    padding: const EdgeInsets.all(8),
                    child: const Center(
                      child: Text(
                        'Ще не вмерла Україна, і слава, і воля, ще нам, браття',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),


                Positioned(
                  left: n + g + r,
                  top: b - f,
                  child: Container(
                    width: j - n - g - r - p,
                    height: f,
                    decoration: customBox(Colors.lightBlueAccent),
                    padding: const EdgeInsets.all(8),
                    child: const Center(
                      child: Text(
                        'Згинуть наші вороженьки, як роса на сонці, запануєм і ми, браття, у своїй сторонці.',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),


                Positioned(
                  left: j - p - i,
                  top: b + s,
                  child: Container(
                    width: i,
                    height: d,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 2),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(2, 2),
                            blurRadius: 2
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Center(
                      child: Text(
                        'І покажем, що ми, браття, козацького роду.',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),


                if (false)
                  ...buildGuideLines(),
              ],
            ),
          ),
        ),
      ),
    );
  }


  List<Widget> buildGuideLines() {
    return [

      Positioned(
        left: n,
        top: 0,
        child: Container(
          width: 1,
          height: m,
          color: Colors.red.withOpacity(0.5),
        ),
      ),

      Positioned(
        left: 0,
        top: b - f,
        child: Container(
          width: j,
          height: 1,
          color: Colors.red.withOpacity(0.5),
        ),
      ),
    ];
  }
}