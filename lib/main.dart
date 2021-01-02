import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_transparent_app_bar/page/simple_appbar_page.dart';
import 'package:flutter_transparent_app_bar/page/transparent_appbar_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'AppBar';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      home: MainPage(title: title),
    );
  }
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({@required this.title});
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomBar(),
      body: buildPages(),
    );
  }

  Widget buildBottomBar() {
    final style = TextStyle(color: Colors.white);

    return BottomNavigationBar(
      selectedItemColor: Colors.white,
      backgroundColor: Colors.purple,
      unselectedItemColor: Colors.white70,
      currentIndex: index,
      items: [
        BottomNavigationBarItem(
          icon: Text(
            'AppBar',
            style: style,
          ),
          title: Text('Normal'),
        ),
        BottomNavigationBarItem(
          icon: Text(
            'AppBar',
            style: style,
          ),
          title: Text('Transparent'),
        ),
      ],
      onTap: (int index) => setState(() => this.index = index),
    );
  }

  Widget buildPages() {
    switch (index) {
      case 0:
        return SimpleAppBarPage();
      case 1:
        return TransparentAppBarPage();
      default:
        return Container();
    }
  }
}
