import 'package:flutter/material.dart';

import '../utils/string_extensions.dart';
import 'app_tab.dart';
import 'about/about_page.dart';
import 'current_weather/presentation/current_weather_page.dart';
import 'forecast_weather/presentation/forecast_weather_page.dart';

const List<Widget> _pages = [
  CurrentWeatherPage(),
  ForecastWeatherPage(),
  AboutPage(),
];

class PageSwitcher extends StatefulWidget {
  const PageSwitcher({Key? key}) : super(key: key);

  @override
  State<PageSwitcher> createState() => _PageSwitcherState();
}

class _PageSwitcherState extends State<PageSwitcher> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedTab,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTabTapped,
        currentIndex: _selectedTab,
        items: AppTab.values
            .map(
              (tab) => BottomNavigationBarItem(
                icon: Icon(tab.icon),
                label: tab.name.capitalized,
                tooltip: tab.tooltip,
              ),
            )
            .toList(),
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() => _selectedTab = index);
  }
}
