import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'user.dart';

Future<List<UserJ>> fetchPost() async {
  final response = await http.get(Uri.parse("http://10.0.2.2:5000/"));

  if (response.statusCode == 200) {
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    var result = jsonData.map<UserJ>((data) => UserJ.fromJson(data)).toList();
    // print(result);
    return result;
  } else {
    throw Exception('Failed to load users');
  }
}


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
            title: const Text("어쩔티비"),
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
  final List<User> _allUsers = [
    User(userName: "XX현", userScoreList: [
      89,
      146,
      141,
      167,
      168,
      135,
      194,
      122,
      143,
      142,
      188,
      132,
      179,
      195,
      160,
      206,
      179,
      156,
      212,
      135,
      126,
      131,
      167,
      125,
      161
    ]),
    User(userName: "XX준", userScoreList: [
      90,
      97,
      83,
      103,
      143,
      129,
      101,
      106,
      95,
      104,
      114,
      81,
      100,
      80,
      132,
      97,
      97,
      147,
      79,
      95,
      86,
      95,
      85,
      154,
      113
    ]),
    User(userName: "XX곤", userScoreList: [
      96,
      78,
      123,
      92,
      80,
      100,
      107,
      107,
      110,
      100,
      88,
      82,
      100,
      109,
      84,
      91,
      83,
      113,
      108,
      76,
      96,
      81,
      101,
      89,
      157
    ]),
    User(userName: "XX일", userScoreList: [
      140,
      91,
      170,
      112,
      121,
      139,
      142,
      132,
      123,
      136,
      102,
      172,
      160,
      200
    ]),
    User(userName: "XX석", userScoreList: [
      116,
      115,
      93,
      121,
      96,
      139,
      131,
      111,
      115,
      180,
      127,
      111,
      137,
      119,
      88,
      125,
      103,
    ])
  ];

  @override
  Widget build(BuildContext context) {
    return _allUsers.isNotEmpty
        ? ListView.builder(
            itemCount: _allUsers.length,
            itemBuilder: (context, int index) {
              return Card(
                  child: ListTile(
                title: Text(_allUsers[index].userName),
                leading: const Icon(Icons.account_circle_sharp),
                // onTap: () {
                //   showDialog(
                //       context: context,
                //       builder: (BuildContext context) {
                //         return AlertDialog(
                //             title: Text('${_allUsers[index].userName}의 상세정보'),
                //             content: SizedBox(
                //               child: Column(children: [
                //                 Text(('평균 점수: ${_allUsers[index].average}')),
                //                 Text(('핸디캡: ${_allUsers[index].handicap}'))
                //               ]),
                //               height: 100,
                //             ));
                //       });
                // },
                onTap: fetchPost,
              ));
            },
          )
        : const Text("No items");
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
      child: Text("설정페이지에용"),
    );
  }
}
