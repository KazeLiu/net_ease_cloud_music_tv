import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:net_ease_cloud_music_tv/provider/user_provider.dart';
import 'package:net_ease_cloud_music_tv/router/router.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (_) => UserProvider(),
        )
      ],
      child: MaterialApp(
        title: '网易云音乐TV超级青春版',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
        ),
        builder: (ctx, child) {
          return SafeArea(
            child: Scaffold(
              body: Container(
                color: const Color(0xFF212124),
                child: child!,
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
