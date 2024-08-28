import 'dart:convert';

import 'package:flutter/foundation.dart';

class QuizModel {
  String id;
  String startPlayerId;
  String startPlayerName;
  String startPlayerPhoto;
  String subject;
  String difficulty;
  List<String> playersIds;
  List<Map<String, dynamic>> startPlayerQuestions;
  List<Map<String, dynamic>> opponentQuestions;
  int startPlayerScore;
  int opponentScore;
  bool isMultiplayer;
  String opponentId;
  String opponentName;
  String opponentPhoto;
  String status;
  int createdAt;
  QuizModel({
    required this.id,
    required this.startPlayerId,
    required this.startPlayerName,
    required this.startPlayerPhoto,
    required this.subject,
    required this.difficulty,
    required this.playersIds,
    required this.startPlayerQuestions,
    required this.opponentQuestions,
    required this.startPlayerScore,
    required this.opponentScore,
    required this.isMultiplayer,
    required this.opponentId,
    required this.opponentName,
    required this.opponentPhoto,
    required this.status,
    required this.createdAt,
  });

  QuizModel copyWith({
    String? id,
    String? startPlayerId,
    String? startPlayerName,
    String? startPlayerPhoto,
    String? subject,
    String? difficulty,
    List<String>? playersIds,
    List<Map<String, dynamic>>? startPlayerQuestions,
    List<Map<String, dynamic>>? opponentQuestions,
    int? startPlayerScore,
    int? opponentScore,
    bool? isMultiplayer,
    String? opponentId,
    String? opponentName,
    String? opponentPhoto,
    String? status,
    int? createdAt,
  }) {
    return QuizModel(
      id: id ?? this.id,
      startPlayerId: startPlayerId ?? this.startPlayerId,
      startPlayerName: startPlayerName ?? this.startPlayerName,
      startPlayerPhoto: startPlayerPhoto ?? this.startPlayerPhoto,
      subject: subject ?? this.subject,
      difficulty: difficulty ?? this.difficulty,
      playersIds: playersIds ?? this.playersIds,
      startPlayerQuestions: startPlayerQuestions ?? this.startPlayerQuestions,
      opponentQuestions: opponentQuestions ?? this.opponentQuestions,
      startPlayerScore: startPlayerScore ?? this.startPlayerScore,
      opponentScore: opponentScore ?? this.opponentScore,
      isMultiplayer: isMultiplayer ?? this.isMultiplayer,
      opponentId: opponentId ?? this.opponentId,
      opponentName: opponentName ?? this.opponentName,
      opponentPhoto: opponentPhoto ?? this.opponentPhoto,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'startPlayerId': startPlayerId});
    result.addAll({'startPlayerName': startPlayerName});
    result.addAll({'startPlayerPhoto': startPlayerPhoto});
    result.addAll({'subject': subject});
    result.addAll({'difficulty': difficulty});
    result.addAll({'playersIds': playersIds});
    result.addAll({'startPlayerQuestions': startPlayerQuestions});
    result.addAll({'opponentQuestions': opponentQuestions});
    result.addAll({'startPlayerScore': startPlayerScore});
    result.addAll({'opponentScore': opponentScore});
    result.addAll({'isMultiplayer': isMultiplayer});
    result.addAll({'opponentId': opponentId});
    result.addAll({'opponentName': opponentName});
    result.addAll({'opponentPhoto': opponentPhoto});
    result.addAll({'status': status});
    result.addAll({'createdAt': createdAt});

    return result;
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      id: map['id'] ?? '',
      startPlayerId: map['startPlayerId'] ?? '',
      startPlayerName: map['startPlayerName'] ?? '',
      startPlayerPhoto: map['startPlayerPhoto'] ?? '',
      subject: map['subject'] ?? '',
      difficulty: map['difficulty'] ?? '',
      playersIds: List<String>.from(map['playersIds']),
      startPlayerQuestions: List<Map<String, dynamic>>.from(
          map['startPlayerQuestions']
              ?.map((x) => Map<String, dynamic>.from(x))),
      opponentQuestions: List<Map<String, dynamic>>.from(
          map['opponentQuestions']?.map((x) => Map<String, dynamic>.from(x))),
      startPlayerScore: map['startPlayerScore']?.toInt() ?? 0,
      opponentScore: map['opponentScore']?.toInt() ?? 0,
      isMultiplayer: map['isMultiplayer'] ?? false,
      opponentId: map['opponentId'] ?? '',
      opponentName: map['opponentName'] ?? '',
      opponentPhoto: map['opponentPhoto'] ?? '',
      status: map['status'] ?? '',
      createdAt: map['createdAt']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'QuizModel(id: $id, startPlayerId: $startPlayerId, startPlayerName: $startPlayerName, startPlayerPhoto: $startPlayerPhoto, subject: $subject, difficulty: $difficulty, playersIds: $playersIds, startPlayerQuestions: $startPlayerQuestions, opponentQuestions: $opponentQuestions, startPlayerScore: $startPlayerScore, opponentScore: $opponentScore, isMultiplayer: $isMultiplayer, opponentId: $opponentId, opponentName: $opponentName, opponentPhoto: $opponentPhoto, status: $status, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuizModel &&
        other.id == id &&
        other.startPlayerId == startPlayerId &&
        other.startPlayerName == startPlayerName &&
        other.startPlayerPhoto == startPlayerPhoto &&
        other.subject == subject &&
        other.difficulty == difficulty &&
        listEquals(other.playersIds, playersIds) &&
        listEquals(other.startPlayerQuestions, startPlayerQuestions) &&
        listEquals(other.opponentQuestions, opponentQuestions) &&
        other.startPlayerScore == startPlayerScore &&
        other.opponentScore == opponentScore &&
        other.isMultiplayer == isMultiplayer &&
        other.opponentId == opponentId &&
        other.opponentName == opponentName &&
        other.opponentPhoto == opponentPhoto &&
        other.status == status &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        startPlayerId.hashCode ^
        startPlayerName.hashCode ^
        startPlayerPhoto.hashCode ^
        subject.hashCode ^
        difficulty.hashCode ^
        playersIds.hashCode ^
        startPlayerQuestions.hashCode ^
        opponentQuestions.hashCode ^
        startPlayerScore.hashCode ^
        opponentScore.hashCode ^
        isMultiplayer.hashCode ^
        opponentId.hashCode ^
        opponentName.hashCode ^
        opponentPhoto.hashCode ^
        status.hashCode ^
        createdAt.hashCode;
  }

  static QuizModel empty() {
    return QuizModel(
      id: '',
      startPlayerId: '',
      startPlayerName: '',
      startPlayerPhoto: '',
      subject: '',
      difficulty: '',
      playersIds: [],
      startPlayerQuestions: [],
      opponentQuestions: [],
      startPlayerScore: 0,
      opponentScore: 0,
      isMultiplayer: false,
      opponentId: '',
      opponentName: '',
      opponentPhoto: '',
      status: '',
      createdAt: 0,
    );
  }

  static QuizModel singlePlayer() {
    return empty().copyWith(
      isMultiplayer: false,
    );
  }
}
