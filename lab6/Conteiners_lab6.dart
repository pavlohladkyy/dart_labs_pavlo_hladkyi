import 'flutter/material.dart';

BoxDecoration customBox(Color color) => BoxDecoration(
      color: color,
      border: Border.all(color: Colors.black, width: 2),
      boxShadow: const [
        BoxShadow(color: Colors.black26, offset: Offset(2, 2), blurRadius: 2),
      ],
    );

class Lab6Layout extends StatelessWidget {
  const Lab6Layout({Key? key}) : super(key: key);

  // Точні розміри згідно з завданням
  static const double a = 0; // min (не використовується в розрахунках)
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
            width: j, // 750
            height: m, // 500
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              color: Colors.grey[50],
            ),
            child: Stack(
              children: [
                // Жовтий контейнер (зліва зверху)
                Positioned(
                  left: n, // 5 від лівого краю
                  top: b - f, // 250 - 150 = 100 від верху
                  child: Container(
                    width: g, // 450
                    height: f, // 150
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
                
                // Синій контейнер (справа зверху)
                Positioned(
                  left: n + g + r, // 5 + 450 + 6 = 461
                  top: b - f, // 250 - 150 = 100 від верху  
                  child: Container(
                    width: j - n - g - r - p, // 750 - 5 - 450 - 6 - 4 = 285
                    height: f, // 150
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
                
                // Білий контейнер (справа знизу)
                Positioned(
                  left: j - p - i, // 750 - 4 - 100 = 646
                  top: b + s, // 250 + 3 = 253
                  child: Container(
                    width: i, // 100
                    height: d, // 150
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
                
                // Додаткові лінії розмітки (опціонально, для перевірки)
                if (false) // Змініть на true, щоб побачити лінії розмітки
                  ...buildGuideLines(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  // Допоміжні лінії для перевірки розмірів (опціонально)
  List<Widget> buildGuideLines() {
    return [
      // Вертикальна лінія на відстані n
      Positioned(
        left: n,
        top: 0,
        child: Container(
          width: 1,
          height: m,
          color: Colors.red.withOpacity(0.5),
        ),
      ),
      // Горизонтальна лінія на відстані b-f
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