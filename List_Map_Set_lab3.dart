// Клас Day представляє дані про один день: дату, температуру та коментар
class Day {
  final String date; // Дата
  final double temperature; // Температура
  final String comment; // Коментар

  Day(this.date, this.temperature, this.comment);

  @override
  String toString() => '$date\t$temperature\t$comment';
}

// Клас Weather містить інформацію про сезон, загальний коментар та список днів
class Weather {
  final String season; // Сезон
  final String comment; // Загальний коментар
  final List<Day> days = []; // Список днів

  Weather(this.season, this.comment);

  // Додає новий день до списку
  void addDay(Day day) => days.add(day);

  // Обчислює середню температуру за всі дні
  double getAverageTemperature() =>
      days.isEmpty ? 0.0 : days.map((d) => d.temperature).reduce((a, b) => a + b) / days.length;

  // Повертає день з максимальною температурою
  Day? getMaxTemperatureDay() =>
      days.isEmpty ? null : days.reduce((a, b) => a.temperature > b.temperature ? a : b);

  // Повертає день з найдовшим коментарем
  Day? getLongestCommentDay() =>
      days.isEmpty ? null : days.reduce((a, b) => a.comment.length > b.comment.length ? a : b);

  // Виводить інформацію про погоду та всі дні
  void showData() {
    print('Інформація про погоду');
    print('Сезон: $season\tКоментар: $comment');
    print('Дані по днях:');
    print('Дата\tТемпература\tКоментар');
    for (var day in days) {
      print(day);
    }
  }
}

void main() {
  // Створюємо об'єкт Weather та додаємо дні
  final weather = Weather('Весна', 'Теплий сезон')
    ..addDay(Day('2024-03-01', 12.5, 'Сонячно'))
    ..addDay(Day('2024-03-02', 15.0, 'Тепло, без опадів'))
    ..addDay(Day('2024-03-03', 10.2, 'Хмарно'))
    ..addDay(Day('2024-03-04', 17.8, 'Дуже тепло'))
    ..addDay(Day('2024-03-05', 13.3, 'Легкий дощ'));

  weather.showData();

  // Виводимо середню температуру
  print('Середня температура: ${weather.getAverageTemperature()}');

  // Виводимо день з максимальною температурою
  final maxTempDay = weather.getMaxTemperatureDay();
  if (maxTempDay != null) {
    print('День з максимальною температурою:');
    print(maxTempDay);
  }

  // Виводимо день з найдовшим коментарем
  final longestCommentDay = weather.getLongestCommentDay();
  if (longestCommentDay != null) {
    print('День з найдовшим коментарем:');
    print(longestCommentDay);
  }
}
