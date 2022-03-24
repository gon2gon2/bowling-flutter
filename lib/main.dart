import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'user.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
class FriendPage extends StatelessWidget {
  const FriendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        Card(
          child: ListTile(
            leading: FlutterLogo(),
            title: Text("XX현"),
          )
         ),
        Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('XX준'),
            )
        ),
        Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('XX곤'),
            )
        ),
        Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('XX일'),
            )
        ),
        Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('XX석'),
            )
        ),
      ]
    );
  }
}

class GroupPage extends StatelessWidget {
  const GroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("그룹페이지에용"),
    );
  }
}

class SchedulePage extends StatelessWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("일정 페이지에용"),
    );
  }
}


class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
     child: Text("설정페이지에용"),
    );
  }
}

