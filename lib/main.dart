import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'user.dart';

const myServerUri = "http://10.0.2.2:3000/scores";
const awsServerUri = "http://54.197.125.47:9711/scores";

Future<List<User>> fetchPost() async {
  // final response = await http.get(Uri.parse(myServerUri));
  final response = await http.get(Uri.parse(awsServerUri));

  if (response.statusCode == 200) {
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    var result = jsonData.map<User>((data) => User.fromJson(data)).toList();
    // print(result[3].average);
    return result;
  } else {
    throw Exception('Failed to load users');
  }
}

Future<http.Response> createScore(int? userId, int userScore) {
  return http.post(
    Uri.parse(awsServerUri),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "user_id": userId,
      "when": "2022-03-25T06:49:07.342Z",
      "place_id": 1,
      "value": userScore
    }),
  );
}

// void main() {
//   createScore();
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: "친구"),
                Tab(text: "그룹"),
                Tab(text: "일정"),
                Tab(text: "설정"),
              ],
            ),
            title: const Text("볼링앱"),
          ),
          body: const TabBarView(
            children: [
              FriendPage(),
              GroupPage(),
              SchedulePage(),
              SettingPage(),
            ],
          ),
        ),
      ),
    );
  }
}

class FriendPage extends StatefulWidget {
  const FriendPage({Key? key}) : super(key: key);

  @override
  State<FriendPage> createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  // final List<User> _allUsers = [
  //   User(userName: "XX현", userScoreList: [
  //     89,
  //     146,
  //     141,
  //     167,
  //     168,
  //     135,
  //     194,
  //     122,
  //     143,
  //     142,
  //     188,
  //     132,
  //     179,
  //     195,
  //     160,
  //     206,
  //     179,
  //     156,
  //     212,
  //     135,
  //     126,
  //     131,
  //     167,
  //     125,
  //     161
  //   ]),
  //   User(userName: "XX준", userScoreList: [
  //     90,
  //     97,
  //     83,
  //     103,
  //     143,
  //     129,
  //     101,
  //     106,
  //     95,
  //     104,
  //     114,
  //     81,
  //     100,
  //     80,
  //     132,
  //     97,
  //     97,
  //     147,
  //     79,
  //     95,
  //     86,
  //     95,
  //     85,
  //     154,
  //     113
  //   ]),
  //   User(userName: "XX곤", userScoreList: [
  //     96,
  //     78,
  //     123,
  //     92,
  //     80,
  //     100,
  //     107,
  //     107,
  //     110,
  //     100,
  //     88,
  //     82,
  //     100,
  //     109,
  //     84,
  //     91,
  //     83,
  //     113,
  //     108,
  //     76,
  //     96,
  //     81,
  //     101,
  //     89,
  //     157
  //   ]),
  //   User(userName: "XX일", userScoreList: [
  //     140,
  //     91,
  //     170,
  //     112,
  //     121,
  //     139,
  //     142,
  //     132,
  //     123,
  //     136,
  //     102,
  //     172,
  //     160,
  //     200
  //   ]),
  //   User(userName: "XX석", userScoreList: [
  //     116,
  //     115,
  //     93,
  //     121,
  //     96,
  //     139,
  //     131,
  //     111,
  //     115,
  //     180,
  //     127,
  //     111,
  //     137,
  //     119,
  //     88,
  //     125,
  //     103,
  //   ])
  // ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchPost(),
        builder: (context, AsyncSnapshot snapshot) {
          dynamic children;
          if (snapshot.hasData) {
            // children = const [Text("dfdfdf")];
            children = ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, int index) {
                return Card(
                    child: ListTile(
                  title: Text(snapshot.data[index].userName),
                  leading: const Icon(Icons.account_circle_sharp),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: Text(
                                  '${snapshot.data[index].userName}의 상세정보'),
                              content: SizedBox(
                                child: Column(children: [
                                  Text(
                                      ('평균 점수: ${snapshot.data[index].average}')),
                                  Text(
                                      ('핸디캡: ${snapshot.data[index].handicap}'))
                                ]),
                                height: 100,
                              ));
                        });
                  },
                ));
              },
            );
          } else if (snapshot.hasError) {
            children = Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            children = const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Awaiting result...'),
            );
          }
          return Center(
            child: children,
          );
        });
  }
}

class GroupPage extends StatelessWidget {
  const GroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("그룹페이지에용"),
    );
  }
}

class SchedulePage extends StatelessWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("일정 페이지에용"),
    );
  }
}

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: MyCustomFormState(),
    );
  }
}

class MyCustomFormState extends StatefulWidget {
  const MyCustomFormState({Key? key}) : super(key: key);

  @override
  State<MyCustomFormState> createState() => _MyCustomFormStateState();
}

class _MyCustomFormStateState extends State<MyCustomFormState> {
  late String userName;
  late String userScore;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        children: [
          Flexible(
            child: Container(
              color: Colors.cyan,
            ),
            flex: 1,
          ),
          Flexible(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  // 이름
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    userName = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '이름을 똑바로 입력하세요';
                    } else if (!possibleNames.contains(value)) {
                      return "'XX곤'이나 'XX석' 처럼 입력하세요";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  // 점수
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    userScore = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '숫자만 제대로 입력하세요';
                    } else if (int.parse(value) > 300) {
                      return '구라치지 마세요';
                    }
                    return null;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+$'))
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      createScore(nameToId[userName], int.parse(userScore));
                      if (_formKey.currentState!.validate()) {
                        print('valid!!');
                      }
                    },
                    child: Text("하하"))
              ],
            ),
            flex: 5,
          ),
          Flexible(
            child: Container(
              color: Colors.cyan,
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
