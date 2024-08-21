import 'package:flutter/material.dart';
import 'app_tile.dart';
import 'app_data.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title, required void Function() onThemeChanged});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: appList.length,
          itemBuilder: (context, index) {
            return AppTile(appData: appList[index]);
          },
        ),
      ),
    );
  }
}
