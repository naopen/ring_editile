import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'package:ring_sns/api/auth.dart';
import 'package:flutter/material.dart';
import 'package:ring_sns/page/chat.dart';
import 'package:ring_sns/page/home.dart';
import 'package:flutter/rendering.dart';
import 'package:ring_sns/page/test_result.dart';

class test extends StatefulWidget {
  test(this.auth);
  Auth auth;

  @override
  State<StatefulWidget> createState() => _test();
}

class _test extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextField(),
            RaisedButton(
                child: Text('投稿'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => test_result(widget.auth, 'テスト')),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
