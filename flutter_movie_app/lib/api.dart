import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> getMovies() async {
  final response = await http.get(
    Uri.parse(
      'https://api.themoviedb.org/3/trending/all/week?api_key=31587b8e43fc93506c8d61552d8a1bf6',
    ),
  );

  var data = jsonDecode(response.body);
  List<dynamic> results = data['results'];
  return results.take(10).toList();
}
