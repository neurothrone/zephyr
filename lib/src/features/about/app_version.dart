import 'package:flutter/material.dart';

import 'package:package_info_plus/package_info_plus.dart';

import '../../core/widgets/custom_circular_progress_indicator.dart';

class AppVersion extends StatefulWidget {
  const AppVersion({super.key});

  @override
  State<AppVersion> createState() => _AppVersionState();
}

class _AppVersionState extends State<AppVersion> {
  Future<String> getAppVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  String? _version;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _loadAppVersion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const CustomCircularProgressIndicator()
        : _version != null
            ? Text("App version: $_version")
            : const Text(
                "Failed to load app version.",
                style: TextStyle(color: Colors.red),
              );
  }

  Future<void> _loadAppVersion() async {
    setState(() => _isLoading = true);
    _version = await _getAppVersion();
    setState(() => _isLoading = false);
  }

  Future<String> _getAppVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }
}
