import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/songs_model.dart';

class SongApiProvider {

    Client client = Client();

    Future<SongModel> fetchSongList() async {
        print("entered");

        var url = Uri.parse("http://localhost:3000/songs");
        final response = await client.get(url);
        
        print(response.body.toString());
        if (response.statusCode == 200) {
        // If the call to the server was successful, parse the JSON
        return SongModel.fromJson(json.decode(response.body));

        } else {
        // If that call was not successful, throw an error.
        throw Exception('Failed to load song');
        }
    }
} 
