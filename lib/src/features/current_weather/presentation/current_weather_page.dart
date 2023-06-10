import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../core/widgets/refresh_icon_button.dart';
import '../../../core/constants.dart';
import '../data/current_local_weather_provider.dart';
import '../data/current_weather_type_provider.dart';
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

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: CurrentWeatherType.values.length,
      vsync: this,
    );
    _tabController.addListener(_onTabChanged);

    _setStartingTab();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
              onPressed: context
                          .watch<CurrentWeatherTypeProvider>()
                          .currentWeatherType ==
                      CurrentWeatherType.local
                  ? context
                      .read<CurrentLocalWeatherProvider>()
                      .getCurrentWeather
                  : null,
              tooltip: "Refresh Weather for Current Location",
            ),
          ],
          bottom: CurrentWeatherPageTabBar(controller: _tabController),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: kPadding20),
          child: TabBarView(
            controller: _tabController,
            children: const [
              LocalLocationWeatherTabView(),
              CustomLocationWeatherTabView(),
            ],
          ),
        ),
      ),
    );
  }

  void _setStartingTab() {
    int startingIndex =
        context.read<CurrentWeatherTypeProvider>().currentWeatherType ==
                CurrentWeatherType.local
            ? 0
            : 1;
    _tabController.index = startingIndex;
  }

  void _onTabChanged() {
    if (!_tabController.indexIsChanging) return;

    context.read<CurrentWeatherTypeProvider>().changeTab(
          _tabController.index == 0
              ? CurrentWeatherType.local
              : CurrentWeatherType.custom,
        );
  }
}
