import 'package:flutter/material.dart';
import 'package:push_notifications/src/pages/detalle_page.dart';
import 'package:push_notifications/src/pages/home_page.dart';

import 'src/providers/push_notifications_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  @override
  void initState() {
    super.initState();

    final pushProvider = new PushNotificationsProvider();
    pushProvider.initNotifications();

    pushProvider.mensajesStream.listen((data) {
      // print('argumento desde main: $argumento');
      // Navigator.pushNamed(context, 'mensaje');
      print('argumento desde main: $data');
      navigatorKey.currentState.pushNamed('detalle', arguments: data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'detalle': (BuildContext context) => DetallePage()
      },
    );
  }
}
