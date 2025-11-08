import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Лабораторна 7 – Варіант 1',
      home: Lab7Screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Lab7Screen extends StatelessWidget {
  const Lab7Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // Parameters from diagram
    const double a = 20.0; // offset from top/left
    const double b = 30.0; // red border width
    const double c = 60.0; // blue rectangle height

    // Calculate dimensions
    const double totalWidth = 330.0;
    const double totalHeight = c + a; // 80px total height

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack із RichText – Варіант 1'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: totalWidth,
          height: totalHeight,
          child: Stack(
            children: [
              // Yellow background (outermost layer)
              Container(
                width: totalWidth,
                height: totalHeight,
                color: Colors.yellow,
              ),
              // Red rectangle (middle layer) - offset by 'a' from top/left
              Positioned(
                top: a,
                left: a,
                child: Container(
                  width: totalWidth - a,
                  height: c,
                  color: Colors.red,
                ),
              ),
              // Blue rectangle (inner layer) - offset by 'b' from red rectangle
              Positioned(
                top: a + b,
                left: a + b,
                child: Container(
                  width: totalWidth - a - b,
                  height: c - b,
                  color: Colors.blue,
                ),
              ),
              // RichText positioned on yellow background
              Positioned(
                top: 5,
                left: 185,
                child: RichText(
                  text: TextSpan(
                    text: "Hi! ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: "NLTU",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Dimension indicators (optional - for visualization
            ],
          ),
        ),
      ),
    );
  }
}