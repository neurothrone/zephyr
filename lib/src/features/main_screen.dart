import 'package:flutter/material.dart';

import 'about/about_page.dart';
import 'current/current_weather_page.dart';
import 'forecast/forecast_weather_page.dart';

const List<Widget> _pages = [
  CurrentWeatherPage(),
  ForecastWeatherPage(),
  AboutPage(),
];

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        backgroundColor: Colors.deepPurple,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTabTapped,
        currentIndex: _selectedIndex,
        // type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.deepPurple,
        iconSize: 40.0,
        selectedFontSize: 20,
        // unselectedFontSize: 20,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        selectedIconTheme: const IconThemeData(
          color: Colors.amberAccent,
          // size: 40,
        ),
        selectedItemColor: Colors.amberAccent,
        // selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedIconTheme: const IconThemeData(
          color: Colors.red,
          // size: 40,
        ),
        unselectedItemColor: Colors.red,
        // unselectedLabelStyle: ,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.wb_sunny_rounded),
              label: "Current",
              tooltip: "Current"),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_rounded),
            label: "Forecast",
            tooltip: "Forecast",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.info_rounded), label: "About", tooltip: "About"),
        ],
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() => _selectedIndex = index);
  }
}
