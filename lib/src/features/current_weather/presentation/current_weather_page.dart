import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../common_widgets/refresh_icon_button.dart';
import '../../../core/constants.dart';
import '../data/current_local_weather_provider.dart';
import 'current_weather_page_tab_bar.dart';
import 'current_weather_type.dart';
import 'custom/custom_location_weather_tab_view.dart';
import 'local/local_location_weather_tab_view.dart';

class CurrentWeatherPage extends StatefulWidget {
  const CurrentWeatherPage({super.key});

  @override
  State<CurrentWeatherPage> createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage>
    with SingleTickerProviderStateMixin /* Requirement of TabController */ {
  late final TabController _tabController;

  bool _isRefreshEnabled = true;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: CurrentWeatherType.values.length,
      vsync: this,
    );
    _tabController.addListener(_onTabChanged);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
          actions: [
            RefreshIconButton(
              onPressed: _isRefreshEnabled
                  ? context
                      .read<CurrentLocalWeatherProvider>()
                      .getCurrentWeather
                  : null,
              tooltip: "Refresh Weather for Current Location",
            ),
          ],
          bottom: CurrentWeatherPageTabBar(controller: _tabController),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            LocalLocationWeatherTabView(),
            CustomLocationWeatherTabView(),
          ],
        ),
      ),
    );
  }

  void _onTabChanged() {
    if (!_tabController.indexIsChanging) return;

    setState(() => _isRefreshEnabled = _tabController.index == 0);
  }
}
