import 'package:flutter/material.dart';
import 'api.dart';

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
    loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top 10 Trending This Week'),
        backgroundColor: const Color(0xFF0C0F14),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          var item = moviesList[index];

          String name = item['title'] ?? item['name'] ?? 'No Title';
          String imageUrl =
              'https://image.tmdb.org/t/p/w500' + item['poster_path'];
          var rating = item['vote_average'];

          return Card(
            color: const Color(0xFF1E242D),
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: Image.network(imageUrl, width: 50, fit: BoxFit.cover),
              title: Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Rating: $rating / 10'),
            ),
          );
        },
      ),
    );
  }
}
