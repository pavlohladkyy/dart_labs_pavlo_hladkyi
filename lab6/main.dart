import 'Conteiners_lab6.dart';
class Lab6App extends StatelessWidget {
  const Lab6App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Лабораторна робота 6',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Lab6Layout(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() {
  runApp(const Lab6App());
}