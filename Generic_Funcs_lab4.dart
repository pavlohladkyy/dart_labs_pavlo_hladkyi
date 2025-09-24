// Generic клас Day<T> для зберігання додаткових даних
class Day<T> {
  final String date;
  final double temperature;
  final String comment;
  final T? extraData;

  Day(this.date, this.temperature, this.comment, [this.extraData]);

  @override
  String toString() =>
      '$date\t$temperature\t$comment${extraData != null ? '\t$extraData' : ''}';
}

// Клас Weather<T> з generic методами
class Weather<T> {
  final String season;
  final String comment;
  final List<Day<T>> days = [];

  Weather(this.season, this.comment);

  // Додає новий день до списку
  void addDay(Day<T> day) => days.add(day);

  // Generic метод для пошуку дня за критерієм
  Day<T>? findDayBy(bool Function(Day<T>) predicate) {
    for (var day in days) {
      if (predicate(day)) return day;
    }
    return null;
  }

  // Generic метод для обробки списку днів
  List<R> mapDays<R>(R Function(Day<T>) mapper) {
    return days.map(mapper).toList();
  }

  // Generic метод для фільтрації днів
  List<Day<T>> filterDays(bool Function(Day<T>) predicate) {
    return days.where(predicate).toList();
  }

  // Обчислює середню температуру за всі дні
  double getAverageTemperature() =>
      days.isEmpty ? 0.0 : days.map((d) => d.temperature).reduce((a, b) => a + b) / days.length;

  // Повертає день з максимальною температурою
  Day<T>? getMaxTemperatureDay() =>
      days.isEmpty ? null : days.reduce((a, b) => a.temperature > b.temperature ? a : b);

  // Повертає день з найдовшим коментарем
  Day<T>? getLongestCommentDay() =>
      days.isEmpty ? null : days.reduce((a, b) => a.comment.length > b.comment.length ? a : b);

  // Виводить інформацію про погоду та всі дні
  void showData() {
    print('Інформація про погоду');
    print('Сезон: $season\tКоментар: $comment');
    print('Дані по днях:');
    print('Дата\tТемпература\tКоментар\tExtraData');
    for (var day in days) {
      print(day);
    }
  }
}

void main() {
  // Створюємо об'єкт Weather з додатковими даними типу int (наприклад, індекс дня)
  final weather = Weather<int>('Весна', 'Теплий сезон')
    ..addDay(Day('2024-03-01', 12.5, 'Сонячно', 1))
    ..addDay(Day('2024-03-02', 15.0, 'Тепло, без опадів', 2))
    ..addDay(Day('2024-03-03', 10.2, 'Хмарно', 3))
    ..addDay(Day('2024-03-04', 17.8, 'Дуже тепло', 4))
    ..addDay(Day('2024-03-05', 13.3, 'Легкий дощ', 5));

  weather.showData();

  print('Середня температура: ${weather.getAverageTemperature()}');

  final maxTempDay = weather.getMaxTemperatureDay();
  if (maxTempDay != null) {
    print('День з максимальною температурою:');
    print(maxTempDay);
  }

  final longestCommentDay = weather.getLongestCommentDay();
  if (longestCommentDay != null) {
    print('День з найдовшим коментарем:');
    print(longestCommentDay);
  }

  // Використання generic методів:
  // 1. findDayBy
  final foundDay = weather.findDayBy((d) => d.temperature > 16);
  if (foundDay != null) {
    print('Перший день з температурою > 16:');
    print(foundDay);
  }

  // 2. mapDays
  final comments = weather.mapDays((d) => d.comment);
  print('Всі коментарі: $comments');

  // 3. filterDays
  final warmDays = weather.filterDays((d) => d.temperature > 13);
  print('Дні з температурою > 13:');
  for (var day in warmDays) {
    print(day);
  }
}