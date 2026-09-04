import 'package:flutter/material.dart';
import 'api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MovieHomePage(),
    );
  }
}

class MovieHomePage extends StatefulWidget {
  const MovieHomePage({super.key});

  @override
  State<MovieHomePage> createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage> {
  List<dynamic> moviesList = [];

  void loadMovies() async {
    var result = await getMovies();

    setState(() {
      moviesList = result;
    });
  }

  @override
  void initState() {
    super.initState();
    loadMovies(); // Automatically loads movies on startup
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top 10 Trending This Week'),
        backgroundColor: Color(0xFF0C0F14),
        centerTitle: true,
      ),
      body: moviesList.isEmpty
          ? Center(
              child: CircularProgressIndicator(color: Color(0xFFD17842)),
            )
          : ListView.builder(
              itemCount: moviesList.length,
              itemBuilder: (context, index) {
                var item = moviesList[index];

                String name = item['title'] ?? item['name'] ?? 'No Title';
                String imageUrl = item['poster_path'] != null
                    ? 'https://image.tmdb.org/t/p/w500${item['poster_path']}'
                    : '';
                var rating = item['vote_average'];

                return Card(
                  color: Color(0xFF1E242D),
                  margin: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: ListTile(
                    leading: imageUrl.isNotEmpty
                        ? Image.network(imageUrl, width: 50, fit: BoxFit.cover)
                        : Icon(Icons.movie, size: 50),
                    title: Text(
                      name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Rating: ${rating.toStringAsFixed(1)} / 10',
                    ),
                  ),
                );
              },
            ),
    );
  }
}
