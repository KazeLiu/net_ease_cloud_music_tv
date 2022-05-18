import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/playlist/play_and_song_model.dart';
import '../../provider/play_provider.dart';
import '../../tool/color.dart';

class PlayController extends StatefulWidget {
  const PlayController({Key? key}) : super(key: key);

  @override
  State<PlayController> createState() => _PlayControllerState();
}

class _PlayControllerState extends State<PlayController> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() {
    // Provider.of<PlayProvider>(context, listen: false).playAndSongModel
  }

  @override
  Widget build(BuildContext context) {
    return Selector<PlayProvider, PlayDetailSongDetailModel>(
      selector: (context, model) => model.playingSongData,
      builder: (ctx, data, _) {
        return data.songName == null
            ? Container()
            : Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.red,
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: 95,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Image.network(data.songImage!),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.songName!,
                                    style: KazeFontStyles.text20CW,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  Text(
                                    '${data.songAuthorName}',
                                    style: KazeFontStyles.text16CW,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              _PlayControllerBtn(),
                              // Text("进度条"),
                              Text("00:00:00/00:00:00")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
      },
    );
  }

  _PlayControllerBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.loop)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.skip_previous)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.play_arrow)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.pause)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.skip_next_sharp)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.list_rounded)),
      ],
    );
  }
}
