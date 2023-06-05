import 'package:flutter/material.dart';
import 'package:my_app/state_management/provider/theme_changer_provider.dart';
import 'package:provider/provider.dart';

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({super.key});

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dark Theme'),
      ),
      body: Column(children: [
        RadioListTile<ThemeMode>(
          title: const Text('Light Mode'),
          value: ThemeMode.light,
          groupValue: themeChanger.themeMode,
          onChanged: themeChanger.setTheme,
        ),
        RadioListTile<ThemeMode>(
            title: const Text('Dark Mode'),
            value: ThemeMode.dark,
            groupValue: themeChanger.themeMode,
            onChanged: themeChanger.setTheme),
        RadioListTile<ThemeMode>(
            title: const Text('System Mode'),
            value: ThemeMode.system,
            groupValue: themeChanger.themeMode,
            onChanged: themeChanger.setTheme),
      ]),
    );
  }
}
