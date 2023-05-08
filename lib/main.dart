import 'package:app_challenge/core/network/api_network.dart';
import 'package:app_challenge/core/provider/state_provider.dart';
import 'package:app_challenge/core/utils/router_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  ApiNetwork.instance.initConnectionDio();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final mGlobalProvider = StateProvider();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => mGlobalProvider),
        ],
        child: MaterialApp.router(
          useInheritedMediaQuery: true,
          supportedLocales: const [Locale('en')],
          debugShowCheckedModeBanner: false,
          title: 'App Challenge',
          routerConfig: RouterCustom.router,
        ));
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
