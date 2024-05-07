class CommentModel {
  List<_Comment> _comments = [];

  CommentModel.fromJson(List<dynamic>? parsedJson) {
    if (parsedJson != null) {
      _comments = parsedJson.map((comm) => _Comment.fromJson(comm)).toList();
    }
  }

  List<_Comment> get comments => _comments;
}

class _Comment {
  int? _audioID;
  int? _userID;
  String? _comment;

  _Comment.fromJson(Map<String, dynamic>? comm) {
    _audioID = comm?["audioID"];
    _userID = comm?["userID"];
    _comment = comm?["comment"];
  }

  int? get audioID => _audioID;
  int? get userID => _userID;
  String? get comment => _comment;
}
