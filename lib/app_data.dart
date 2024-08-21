import 'package:flutter/material.dart';

class AppData {
  final String name;
  final String description;
  final IconData icon;
  final String apkUrl; // Add this field to hold the APK file name

  AppData({
    required this.name,
    required this.description,
    required this.icon,
    required this.apkUrl,
  });
}

List<AppData> appList = [
  AppData(
    name: 'FDroid',
    description: 'FDroid is an open-source app store that provides free and open-source software for Android. It focuses on privacy and security by offering a wide range of apps without tracking or intrusive ads.',
    icon: Icons.ac_unit,
    apkUrl: 'https://f-droid.org/F-Droid.apk',
  ),
  AppData(
    name: 'Aurora Store',
    description: 'Aurora Store is an alternative client for the Google Play Store. It allows users to browse, search, and download apps while maintaining anonymity and privacy.',
    icon: Icons.access_alarm,
    apkUrl: 'https://f-droid.org/repo/com.aurora.store_60.apk',
  ),
  AppData(
    name: 'OpenBoard',
    description: 'OpenBoard is an open-source keyboard app that offers a customizable typing experience with features like gesture typing and voice input. Originally developed by Google, it is now maintained by the open-source community.',
    icon: Icons.access_alarm,
    apkUrl: 'https://f-droid.org/repo/org.dslul.openboard.inputmethod.latin_19.apk',
  ),
  AppData(
    name: 'NewPipe',
    description: 'NewPipe is a lightweight YouTube client that allows you to watch and download YouTube videos without advertisements. It emphasizes privacy by not using any proprietary YouTube APIs.',
    icon: Icons.access_alarm,
    apkUrl: 'https://archive.newpipe.net/fdroid/repo/NewPipe_v0.27.2.apk',
  ),
  AppData(
    name: 'Droidfs',
    description: 'Droidfs is a file system app that allows you to manage and interact with files and folders on your Android device. It includes features for file browsing, copying, moving, and deletion.',
    icon: Icons.access_alarm,
    apkUrl: 'https://f-droid.org/repo/sushi.hardcore.droidfs_374.apk',
  ),
  AppData(
    name: 'Fossify Gallery',
    description: 'Fossify Gallery is an open-source gallery app designed to manage and view your photos and videos. It offers a clean and user-friendly interface with features for organizing and sharing media.',
    icon: Icons.access_alarm,
    apkUrl: 'https://f-droid.org/repo/org.fossify.gallery_7.apk',
  ),
  AppData(
    name: 'Instander',
    description: 'Instander is an Instagram client that provides enhanced features and customization options not available in the official Instagram app. It focuses on improving the user experience with additional functionalities.',
    icon: Icons.access_alarm,
    apkUrl: 'https://ota.thedise.me/instander/instander-17.2.apk',
  ),
  AppData(
    name: 'Savertuner',
    description: 'Savertuner is an app designed to help you save and manage your battery life more effectively. It provides various tools and tips to optimize battery usage and extend battery life.',
    icon: Icons.access_alarm,
    apkUrl: 'https://f-droid.org/repo/s1m.savertuner_9.apk',
  ),
  AppData(
    name: 'Silence',
    description: '',
    icon: Icons.access_alarm,
    apkUrl: 'https://f-droid.org/repo/me.lucky.silence_50.apk',
  ),
  AppData(
    name: 'Forcedoze',
    description: '',
    icon: Icons.access_alarm,
    apkUrl: 'https://f-droid.org/repo/com.suyashsrijan.forcedoze_68.apk',
  ),
  AppData(
    name: 'Audile',
    description: '',
    icon: Icons.access_alarm,
    apkUrl: 'https://f-droid.org/repo/com.mrsep.musicrecognizer_21.apk',
  ),
];
