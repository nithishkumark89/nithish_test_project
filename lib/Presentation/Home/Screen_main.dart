import 'package:flutter/material.dart';
import 'package:nithishkumar_test_project/Presentation/Home/screen_home.dart';

import 'Widgets/bottom_navigtionbar.dart';

class ScreenMainPage extends StatefulWidget {
  const ScreenMainPage({super.key});

  @override
  State<ScreenMainPage> createState() => _ScreenMainPageState();
}

class _ScreenMainPageState extends State<ScreenMainPage> {
  final _pages = [
    const ScreenHome(),
    const ScreenHome(),
    const ScreenHome(),
    const ScreenHome(),
    const ScreenHome(),
    // const ScreenExplore(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('Assets/img_3.png', height: 40),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/Home');
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/Home');
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/Home');
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: intexChangeNotifier,
          builder: (context, int intex, _) {
            return _pages[intex];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidgets(),
    );
  }
}
