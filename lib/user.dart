import 'package:collection/collection.dart';

const num standard = 140;
const num ratio = 0.8;

class User {
  late String userName;
  late List<int> userScoreList;

  User({
    required this.userName,
    required this.userScoreList,
  });

  // 핸디캡 get 함수
  num get average => (userScoreList.average.round());
  num get handicap => ((standard - userScoreList.average) * ratio).round();
}

class UserJ {
  final String userName;
  final List<int> userScoreList;

  UserJ({
    required this.userName,
    required this.userScoreList,
  });

  factory UserJ.fromJson(Map<String, dynamic> json) {
    var userScoreFromJson = json['userScoreList'];
    List<int> scoreList = List<int>.from(userScoreFromJson);
    return UserJ(
      userName: json['userName'],
      userScoreList: scoreList,
      
    );
  }

  // 핸디캡 get 함수
  num get average => (userScoreList.average.round());
  num get handicap => ((standard - userScoreList.average) * ratio).round();
}
