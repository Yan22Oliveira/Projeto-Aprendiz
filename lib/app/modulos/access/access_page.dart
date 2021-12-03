import 'package:flutter/material.dart';

class AccessPage extends StatefulWidget {

  final String? title;
  const AccessPage({Key? key, this.title = "Access"}) : super(key: key);

  @override
  _AccessPageState createState() => _AccessPageState();
}

class _AccessPageState extends State<AccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Column(
        children: const <Widget>[],
      ),
    );
  }
}
