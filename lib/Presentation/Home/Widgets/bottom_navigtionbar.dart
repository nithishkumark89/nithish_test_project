import 'package:flutter/material.dart';
import 'package:nithishkumar_test_project/Presentation/Home/screen_home.dart';

ValueNotifier<int> intexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidgets extends StatelessWidget {
  const BottomNavigationWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: intexChangeNotifier,
      builder: (context, newIntex, _) {
        return BottomNavigationBar(
          currentIndex: newIntex,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey,
          selectedItemColor: Colors.red[700],
          unselectedItemColor: Colors.grey[800],
          selectedFontSize: 15,
          unselectedFontSize: 13,
          showSelectedLabels: true,
          selectedLabelStyle: TextStyle(
              color:Colors.black),
          unselectedLabelStyle: TextStyle(
              color:Colors.black),
          selectedIconTheme: IconThemeData(color: Colors.red[700], size: 35),
          unselectedIconTheme: IconThemeData(color: Colors.grey[700], size: 25),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Swan',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.branding_watermark_outlined), label: 'Brands'),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('Assets/BR_Icons/Asset 10@12x.png')),
              label: 'Best Items',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            // BottomNavigationBarItem(icon: Icon(Icons.download), label: 'Downloads'),
          ],
        );
      },
    );
  }
}
