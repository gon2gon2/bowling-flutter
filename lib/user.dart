import 'package:collection/collection.dart';

const num standard = 140;
const num ratio = 0.8;

class User {
  final String userName;
  final List<int> userScoreList;

  User({
    required this.userName,
    required this.userScoreList,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    var userScoreFromJson = json['userScoreList'];
    List<int> scoreList = List<int>.from(userScoreFromJson);
    return User(
      userName: json['userName'],
      userScoreList: scoreList,
    );
  }

  // 핸디캡 get 함수
  num get average => (userScoreList.average.round());
  num get handicap => ((standard - userScoreList.average) * ratio).round();
}

const Map<String, int> nameToId = {
  'XX현': 1,
  'XX준': 2,
  'XX곤': 3,
  'XX일': 4,
  'XX석': 5,
};

const List<String> possibleNames = [
  'XX현',
  'XX준',
  'XX곤',
  'XX일',
  'XX석',
];
