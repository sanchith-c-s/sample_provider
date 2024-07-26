import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_provider/provider/theme_change_provider.dart';

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({super.key});

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChangeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Dart theme'),
        centerTitle: true,
        //backgroundColor: Colors.red[200],
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
          title: Text('Light Mode'),  
          value: ThemeMode.light, 
          groupValue: themeChanger.themeMode,
          onChanged:themeChanger.setTheme ),
          RadioListTile(
          title: Text('Dark Mode'),  
          value: ThemeMode.dark, 
          groupValue: themeChanger.themeMode,
          onChanged:themeChanger.setTheme ),
          RadioListTile(
          title: Text('System Mode'),  
          value: ThemeMode.system, 
          activeColor: Colors.blue,
          
          groupValue: themeChanger.themeMode,
          onChanged:themeChanger.setTheme ,
          ),
          Icon(Icons.home)

        ],
      ),
    );
  }
}