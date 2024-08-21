import 'package:android_apps/app_data.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:install_plugin/install_plugin.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class AppTile extends StatefulWidget {
  final AppData appData;

  const AppTile({
    super.key,
    required this.appData,
  });

  @override
  _AppTileState createState() => _AppTileState();
}

class _AppTileState extends State<AppTile> {
  double _downloadProgress = 0.0; // Variable to track download progress
  bool _isDownloading = false; // Variable to track if downloading is in progress

  Future<void> downloadAndInstallApk(String url) async {
    setState(() {
      _isDownloading = true;
    });

    try {
      // Get the external storage directory
      Directory tempDir = await getExternalStorageDirectory() ??
          (await getApplicationDocumentsDirectory());

      // Define the path for the downloaded APK
      String apkPath = '${tempDir.path}/${widget.appData.name}.apk';

      // Download the APK file with progress callback
      Dio dio = Dio();
      await dio.download(
        url,
        apkPath,
        onReceiveProgress: (received, total) {
          setState(() {
            _downloadProgress = received / total;
          });
        },
      );

      // Install the APK
      await InstallPlugin.installApk(apkPath, appId: widget.appData.name);
    } catch (e) {
      print('Error downloading or installing APK: $e');
    } finally {
      setState(() {
        _isDownloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(widget.appData.icon),
      title: Text(widget.appData.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.appData.description),
          if (_isDownloading)
            LinearProgressIndicator(value: _downloadProgress),
        ],
      ),
      onTap: () {
        if (!_isDownloading) {
          downloadAndInstallApk(widget.appData.apkUrl);
        }
      },
    );
  }
}
