import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_school/connect.dart';
import 'package:mysql1/mysql1.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  var _newlist = [];

  Future<void> _getNewsList() async {
    var connect = await MySqlConnection.connect(mysqlsettings);
    var results = await connect.query("""
SELECT *, category.name c_name, users.name u_name FROM news
INNER JOIN users ON users.user_id = news.user_id
INNER JOIN category ON news.category_id = category.category_id
ORDER BY news.new_id desc
""");

    for (var item in results) {
      _newlist.add({
        "news_id": item.fields['news_id'],
        "category_id": item.fields['category_id'],
        "thumbnail": item.fields['thumbnail'],
        "title": item.fields['title'],
        "content": item.fields['content'],
        "user_id": item.fields['user_id'],
        "c_name": item.fields['c_name'],
        "u_name": item.fields['u_name']
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getNewsList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 250,
            child: Image.network(
                'https://staticg.sportskeeda.com/editor/2022/01/67e74-16427184135186-1920.jpg'),
            color: Colors.red,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _newlist.length,
              itemBuilder: ((context, index) {
                return Card(
                  child: ListTile(
                    leading: Image.network(_newlist[index]['thumbnail']),
                    title: Text(_newlist[index]['title']),
                    subtitle: Text(_newlist[index]['c_name']),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
