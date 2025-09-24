import 'Generic_Funcs_lab4.dart';

// Функція, яка повертає Future через конструктор Future()
Future<Day<T>?> futureFindDayBy<T>(Weather<T> weather, bool Function(Day<T>) predicate) {
  return Future(() {
    return weather.findDayBy(predicate);
  });
}

// Функція, яка повертає Future через конструктор Future.value()
Future<List<R>> futureMapDays<T, R>(Weather<T> weather, R Function(Day<T>) mapper) {
  return Future.value(weather.mapDays(mapper));
}

// Функція, яка повертає Future через конструктор Future()
Future<List<Day<T>>> futureFilterDays<T>(Weather<T> weather, bool Function(Day<T>) predicate) {
  return Future(() => weather.filterDays(predicate));
}

// Асинхронна функція для послідовного виклику та обробки помилок
Future<void> processWeatherAsync() async {
  final weather = Weather<int>('Весна', 'Теплий сезон')
    ..addDay(Day('2024-03-01', 12.5, 'Сонячно', 1))
    ..addDay(Day('2024-03-02', 15.0, 'Тепло, без опадів', 2))
    ..addDay(Day('2024-03-03', 10.2, 'Хмарно', 3))
    ..addDay(Day('2024-03-04', 17.8, 'Дуже тепло', 4))
    ..addDay(Day('2024-03-05', 13.3, 'Легкий дощ', 5));

  try {
    final foundDay = await futureFindDayBy(weather, (d) => d.temperature > 16);
    print('Перший день з температурою > 16: ${foundDay ?? "Не знайдено"}');

    final comments = await futureMapDays(weather, (d) => d.comment);
    print('Всі коментарі: $comments');

    final warmDays = await futureFilterDays(weather, (d) => d.temperature > 13);
    print('Дні з температурою > 13:');
    for (var day in warmDays) {
      print(day);
    }
  } catch (e) {
    print('Виникла помилка: $e');
  }
}

void main() async {
  await processWeatherAsync();
}