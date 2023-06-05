import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/palette.dart';
import '../../../core/theme.dart';
import '../../../services/location_service.dart';
import '../../../services/weather_service.dart';
import '../../forecast_weather/domain/forecast_weather.dart';
import '../domain/location_weather.dart';
import 'current_weather_page_tab_bar.dart';
import 'custom/custom_location_weather_content.dart';
import 'local/local_location_weather_content.dart';

class CurrentWeatherPage extends StatefulWidget {
  const CurrentWeatherPage({super.key});

  @override
  State<CurrentWeatherPage> createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage>
    with SingleTickerProviderStateMixin /* Requirement of TabController */ {
  late final TabController _tabController;

  final _weatherService = WeatherService();
  final _locationService = LocationService();

  LocationWeather? _currentWeather;
  List<ForecastWeather> _forecastList = [];

  bool _isRefreshEnabled = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: LocationWeatherType.values.length,
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
            IconButton(
              onPressed: _isRefreshEnabled ? _getCurrentWeather : null,
              icon: Icon(
                Icons.refresh_rounded,
                color: _isRefreshEnabled ? Palette.darkOrange : disabledColor,
              ),
              tooltip: "Refresh Weather for Current Location",
            ),
          ],
          bottom: CurrentWeatherPageTabBar(controller: _tabController),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            LocalLocationWeatherContent(
              isLoading: _isLoading,
              weather: _currentWeather,
              forecastList: _forecastList,
            ),
            const CustomLocationWeatherContent(),
          ],
        ),
      ),
    );
  }

  void _onTabChanged() {
    if (!_tabController.indexIsChanging) return;

    setState(() => _isRefreshEnabled = _tabController.index == 0);
  }

  Future<void> _getCurrentWeather() async {
    _currentWeather = null;
    _forecastList = [];

    setState(() => _isLoading = true);

    final position = await _locationService.getCurrentLocation();

    if (position == null) {
      // TODO: show alert: location permission is required
      setState(() => _isLoading = false);
      return;
    }

    final newWeather = await _weatherService.getCurrentWeatherByPosition(
      latitude: position.latitude,
      longitude: position.longitude,
    );
    final newForecastList = await _weatherService.getForecastWeatherByPosition(
      latitude: position.latitude,
      longitude: position.longitude,
    );

    if (newWeather != null && newForecastList.isNotEmpty) {
      _currentWeather = newWeather;
      // Only interested in the 5 next intervals
      _forecastList = newForecastList.getRange(1, 6).toList();
    }

    setState(() => _isLoading = false);
  }
}
