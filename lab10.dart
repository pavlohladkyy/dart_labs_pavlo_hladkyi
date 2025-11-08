import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Українські співанки',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const UkrainianSongsScreen(),
    );
  }
}

class UkrainianSongsScreen extends StatefulWidget {
  const UkrainianSongsScreen({super.key});

  @override
  State<UkrainianSongsScreen> createState() => _UkrainianSongsScreenState();
}

class _UkrainianSongsScreenState extends State<UkrainianSongsScreen> {
  // Список українських співанок
  final List<Song> songs = [
    Song(
      title: 'Щедрик',
      author: 'Микола Леонтович',
      description: 'Українська народна щедрівка в обробці Миколи Леонтовича',
      lyrics: 'Щедрик, щедрик, щедрівочка,\nПрилетіла ластівочка...',
      icon: Icons.music_note,
      color: Colors.blue[100]!,
    ),
    Song(
      title: 'Їхав козак за Дунай',
      author: 'Народна',
      description: 'Популярна українська народна пісня',
      lyrics: 'Їхав козак за Дунай,\nСказав: "Дівчино, прощай!"...',
      icon: Icons.sailing,
      color: Colors.yellow[100]!,
    ),
    Song(
      title: 'Ой у лузі червона калина',
      author: 'Степан Чарнецький',
      description: 'Маршова пісня Січових Стрільців',
      lyrics: 'Ой, у лузі червона калина похилилася,\nЧогось наша славна Україна зажурилася...',
      icon: Icons.local_florist,
      color: Colors.red[100]!,
    ),
    Song(
      title: 'Реве та стогне Дніпр широкий',
      author: 'Тарас Шевченко',
      description: 'Романс на вірші Тараса Шевченка',
      lyrics: 'Реве та стогне Дніпр широкий,\nСердитий вітер завива...',
      icon: Icons.waves,
      color: Colors.cyan[100]!,
    ),
    Song(
      title: 'Ой, не ходи, Грицю',
      author: 'Народна',
      description: 'Українська народна пісня',
      lyrics: 'Ой, не ходи, Грицю, та й на вечорниці,\nВ мене, твоя мати, заболять очиці...',
      icon: Icons.nightlight_round,
      color: Colors.purple[100]!,
    ),
    Song(
      title: 'Засвіт встали козаченьки',
      author: 'Народна',
      description: 'Козацька пісня',
      lyrics: 'Засвіт встали козаченьки,\nВсі з похідними торбаченьки...',
      icon: Icons.wb_sunny,
      color: Colors.orange[100]!,
    ),
    Song(
      title: 'Віють вітри',
      author: 'Народна',
      description: 'Ліричні пісня про кохання',
      lyrics: 'Віють вітри, віють буйні,\nАж дуби гнуться до землі...',
      icon: Icons.air,
      color: Colors.green[100]!,
    ),
  ];

  String selectedDirection = 'vertical';
  bool isReversed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Українські співанки'),
        centerTitle: true,
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(isReversed ? Icons.arrow_upward : Icons.arrow_downward),
            onPressed: () {
              setState(() {
                isReversed = !isReversed;
              });
            },
            tooltip: isReversed ? 'Звичайний порядок' : 'Зворотний порядок',
          ),
        ],
      ),
      body: Column(
        children: [
          // Панель керування
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.blue[50],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Напрямок: ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                SegmentedButton<String>(
                  segments: const [
                    ButtonSegment(
                      value: 'vertical',
                      label: Text('Вертикальний'),
                      icon: Icon(Icons.view_list),
                    ),
                    ButtonSegment(
                      value: 'horizontal',
                      label: Text('Горизонтальний'),
                      icon: Icon(Icons.view_carousel),
                    ),
                  ],
                  selected: {selectedDirection},
                  onSelectionChanged: (Set<String> newSelection) {
                    setState(() {
                      selectedDirection = newSelection.first;
                    });
                  },
                ),
              ],
            ),
          ),
          // ListView
          Expanded(
            child: ListView.builder(
              scrollDirection: selectedDirection == 'vertical'
                  ? Axis.vertical
                  : Axis.horizontal,
              reverse: isReversed,
              padding: const EdgeInsets.all(16),
              physics: const BouncingScrollPhysics(),
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return SongCard(
                  song: songs[index],
                  isHorizontal: selectedDirection == 'horizontal',
                );
              },
            ),
          ),
          // Інформаційна панель
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.blue[700],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.music_note, color: Colors.white),
                const SizedBox(width: 8),
                Text(
                  'Всього співанок: ${songs.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Клас для збереження інформації про пісню
class Song {
  final String title;
  final String author;
  final String description;
  final String lyrics;
  final IconData icon;
  final Color color;

  Song({
    required this.title,
    required this.author,
    required this.description,
    required this.lyrics,
    required this.icon,
    required this.color,
  });
}

// Віджет для відображення картки пісні
class SongCard extends StatefulWidget {
  final Song song;
  final bool isHorizontal;

  const SongCard({
    Key? key,
    required this.song,
    required this.isHorizontal,
  }) : super(key: key);

  @override
  State<SongCard> createState() => _SongCardState();
}

class _SongCardState extends State<SongCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.isHorizontal ? 300 : null,
      margin: widget.isHorizontal
          ? const EdgeInsets.only(right: 16)
          : const EdgeInsets.only(bottom: 16),
      child: Card(
        elevation: 4,
        color: widget.song.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Заголовок з іконкою
                Row(
                  children: [
                    Icon(
                      widget.song.icon,
                      size: 32,
                      color: Colors.blue[700],
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.song.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.song.author,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      isExpanded ? Icons.expand_less : Icons.expand_more,
                      color: Colors.blue[700],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Опис
                Text(
                  widget.song.description,
                  style: const TextStyle(fontSize: 14),
                ),
                // Розширена інформація
                if (isExpanded) ...[
                  const Divider(height: 24),
                  const Text(
                    'Текст:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.song.lyrics,
                    style: const TextStyle(
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}