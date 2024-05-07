class SongModel {
  List<_Song> _songs = [];

  SongModel.fromJson(List<dynamic>? parsedJson) {
    if (parsedJson != null) {
      _songs = parsedJson.map((song) => _Song.fromJson(song)).toList();
    }
  }

  List<_Song> get songs => _songs;
}

class _Song {
  int? _id;
  int? _albumid;
  int? _audioid;
  String? _lyrics;
  String? _publicationDate;
  String? _title;
  int? _userid;
  int? _version;
  String? _imageUrl;

  _Song.fromJson(Map<String, dynamic>? song) {
    _id = song?["id"];
    _albumid = song?["albumid"];
    _audioid = song?["audioid"];
    _lyrics = song?["lyrics"];
    _publicationDate = song?["publicationDate"];
    _title = song?["title"];
    _userid = song?["userid"];
    _version = song?["version"];
    _imageUrl = song?["imageUrl"];
  }

  int? get version => _version;
  int? get userid => _userid;
  String? get title => _title;
  String? get publicationDate => _publicationDate;
  String? get lyrics => _lyrics;
  int? get audioid => _audioid;
  int? get albumid => _albumid;
  int? get id => _id;
  String? get imageUrl => _imageUrl;
}
