import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:net_ease_cloud_music_tv/page/playlist/play_controller.dart';
import 'package:net_ease_cloud_music_tv/provider/play_provider.dart';
import 'package:net_ease_cloud_music_tv/provider/user_provider.dart';
import 'package:net_ease_cloud_music_tv/router/router.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  static final kazePlayer = AudioPlayer();
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider<PlayProvider>(
          create: (_) => PlayProvider(),
        ),
      ],
      child: MaterialApp(
        title: '网易云音乐TV超级青春版',
        navigatorKey: navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
        ),
        builder: (ctx, child) {
          return SafeArea(
            child: Scaffold(
              body: Container(
                color: const Color(0xFF212124),
                child: Column(
                  children: [
                    Expanded(child: child!),
                    const SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: PlayController(),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        // routes: KazeRouter.routes,
        onGenerateRoute: KazeRouter.routeGenerator,
        initialRoute: "/",
      ),
    );
  }
}
