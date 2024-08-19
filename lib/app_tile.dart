import 'package:flutter/material.dart';
import 'package:install_plugin/install_plugin.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'dart:io';
import 'app_data.dart';

class AppTile extends StatelessWidget {
  final AppData appData;

  const AppTile({super.key, required this.appData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          // Get the app's cache directory or external storage directory
          Directory? tempDir = await getExternalStorageDirectory();
          String tempPath = tempDir!.path;

          // Construct the full path to the APK file in the assets
          String apkAssetPath = 'apk/${appData.apkFileName}';
          String apkFilePath = '$tempPath/${appData.apkFileName}';

          // Copy the APK from assets to the temp directory
          ByteData data = await rootBundle.load(apkAssetPath);
          List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
          await File(apkFilePath).writeAsBytes(bytes);

          // Install the APK
          await InstallPlugin.installApk(apkFilePath);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to install APK: $e')),
          );
        }
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8, // Adjust for full-width display
        child: Card(
          child: ListTile(
            leading: Icon(appData.icon),
            title: Text(appData.name),
            subtitle: Text(appData.description),
          ),
        ),
      ),
    );
  }
}
