class InteractionModel {
  final int audioId;
  final int userId;

  InteractionModel({
    required this.audioId,
    required this.userId,
  });

  factory InteractionModel.fromJson(Map<String, dynamic> json) {
    return InteractionModel(
      audioId: json['audioID'],
      userId: json['userID'],
    );
  }
}