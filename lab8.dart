import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Лабораторна робота №8',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const Lab8Screen(),
    );
  }
}

class Lab8Screen extends StatelessWidget {
  const Lab8Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Лабораторна робота №8 - StatelessWidget'),
        centerTitle: true,
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          width: 800,
          height: 600,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 3),
            color: Colors.grey[200],
          ),
          child: Column(
            children: [
              // Верхня сіра область
              Container(
                height: 130,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
              ),
              // Середня частина з жовтим і блакитним контейнерами
              Expanded(
                child: Row(
                  children: [
                    // Жовтий контейнер (ліворуч)
                    CustomTextContainer(
                      backgroundColor: Colors.yellow,
                      text: 'Ще не вмерла Україна, і слава, і воля, ще нам, браття',
                      textColor: Colors.black,
                      borderColor: Colors.black,
                    ),
                    // Блакитний контейнер (праворуч)
                    Expanded(
                      child: Column(
                        children: [
                          CustomTextContainer(
                            backgroundColor: Colors.lightBlue[300]!,
                            text: 'Згинуть наші вороженьки, як роса на сонці, запануєм і ми, браття, у своїй сторонці.',
                            textColor: Colors.black,
                            borderColor: Colors.black,
                            flex: 1,
                          ),
                          CustomTextContainer(
                            backgroundColor: Colors.white,
                            text: 'І покажем, що ми, браття, козацького роду.',
                            textColor: Colors.black,
                            borderColor: Colors.black,
                            width: 150,
                            height: 200,
                            alignment: Alignment.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Власний віджет, успадкований від StatelessWidget
// з передачею не менше трьох властивостей через конструктор
class CustomTextContainer extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final Color textColor;
  final Color borderColor;
  final double? width;
  final double? height;
  final int? flex;
  final AlignmentGeometry alignment;

  const CustomTextContainer({
    Key? key,
    required this.backgroundColor,
    required this.text,
    required this.textColor,
    this.borderColor = Colors.black,
    this.width,
    this.height,
    this.flex,
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget container = Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor, width: 2),
      ),
      padding: const EdgeInsets.all(20),
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: textColor,
          height: 1.5,
        ),
        textAlign: TextAlign.center,
      ),
    );

    // Якщо задано flex, обгортаємо в Expanded
    if (flex != null) {
      return Expanded(
        flex: flex!,
        child: container,
      );
    }

    // Якщо не задано width, обгортаємо в Expanded за замовчуванням
    if (width == null && height == null) {
      return Expanded(child: container);
    }

    return container;
  }
}