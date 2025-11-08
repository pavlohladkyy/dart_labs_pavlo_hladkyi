import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Лабораторна робота №9',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const Lab9Screen(),
    );
  }
}

class Lab9Screen extends StatelessWidget {
  const Lab9Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Лабораторна робота №9 - StatefulWidget'),
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
              // Верхня сіра область з лічильником
              AnimatedCounter(
                initialValue: 0,
                increment: 1,
                backgroundColor: Colors.grey[300]!,
              ),
              // Середня частина з жовтим і блакитним контейнерами
              Expanded(
                child: Row(
                  children: [
                    // Жовтий контейнер з інтерактивністю
                    InteractiveTextContainer(
                      backgroundColor: Colors.yellow,
                      text: 'Ще не вмерла Україна, і слава, і воля, ще нам, браття',
                      textColor: Colors.black,
                      borderColor: Colors.black,
                    ),
                    // Блакитний контейнер
                    Expanded(
                      child: Column(
                        children: [
                          InteractiveTextContainer(
                            backgroundColor: Colors.lightBlue[300]!,
                            text: 'Згинуть наші вороженьки, як роса на сонці, запануєм і ми, браття, у своїй сторонці.',
                            textColor: Colors.black,
                            borderColor: Colors.black,
                            flex: 1,
                          ),
                          InteractiveTextContainer(
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

// Власний віджет, успадкований від StatefulWidget
// з передачею не менше трьох властивостей через конструктор
class InteractiveTextContainer extends StatefulWidget {
  final Color backgroundColor;
  final String text;
  final Color textColor;
  final Color borderColor;
  final double? width;
  final double? height;
  final int? flex;
  final AlignmentGeometry alignment;

  const InteractiveTextContainer({
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
  State<InteractiveTextContainer> createState() => _InteractiveTextContainerState();
}

class _InteractiveTextContainerState extends State<InteractiveTextContainer> {
  bool _isPressed = false;
  int _clickCount = 0;

  void _handleTap() {
    setState(() {
      _clickCount++;
    });
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _isPressed = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget container = GestureDetector(
      onTap: _handleTap,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: _isPressed
              ? widget.backgroundColor.withOpacity(0.7)
              : widget.backgroundColor,
          border: Border.all(
              color: widget.borderColor,
              width: _isPressed ? 3 : 2
          ),
        ),
        padding: const EdgeInsets.all(20),
        alignment: widget.alignment,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 16,
                color: widget.textColor,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            if (_clickCount > 0)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Кліків: $_clickCount',
                  style: TextStyle(
                    fontSize: 12,
                    color: widget.textColor.withOpacity(0.6),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );

    // Якщо задано flex, обгортаємо в Expanded
    if (widget.flex != null) {
      return Expanded(
        flex: widget.flex!,
        child: container,
      );
    }

    // Якщо не задано width, обгортаємо в Expanded за замовчуванням
    if (widget.width == null && widget.height == null) {
      return Expanded(child: container);
    }

    return container;
  }
}

// Додатковий StatefulWidget для лічильника у верхній частині
class AnimatedCounter extends StatefulWidget {
  final int initialValue;
  final int increment;
  final Color backgroundColor;

  const AnimatedCounter({
    Key? key,
    required this.initialValue,
    required this.increment,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter> {
  late int _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  void _incrementValue() {
    setState(() {
      _value += widget.increment;
    });
  }

  void _decrementValue() {
    setState(() {
      _value -= widget.increment;
    });
  }

  void _resetValue() {
    setState(() {
      _value = widget.initialValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        border: Border(
          bottom: BorderSide(color: Colors.black, width: 2),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Лічильник: $_value',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _decrementValue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[400],
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('-'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _resetValue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[600],
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Скинути'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _incrementValue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[400],
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('+'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}