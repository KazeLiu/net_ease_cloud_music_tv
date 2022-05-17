import 'package:flutter/material.dart';

class PlayController extends StatefulWidget {
  const PlayController({Key? key}) : super(key: key);
  static String routerName = "/playController";

  @override
  State<PlayController> createState() => _PlayControllerState();
}

class _PlayControllerState extends State<PlayController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [Text("转盘"), Text("歌词")],
          ),
          Text("进度条")
        ],
      ),
    );
  }
}
