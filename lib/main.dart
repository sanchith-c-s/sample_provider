import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_provider/homepage.dart';
import 'package:sample_provider/provider/auth_provider.dart';
import 'package:sample_provider/provider/count_provider.dart';
import 'package:sample_provider/provider/example_one_provider.dart';
import 'package:sample_provider/provider/favourite_prodiver.dart';
import 'package:sample_provider/provider/theme_change_provider.dart';
import 'package:sample_provider/screens/count_example.dart';
import 'package:sample_provider/screens/dark_theme.dart';
import 'package:sample_provider/screens/example_one.dart';
import 'package:sample_provider/screens/favourite/favourite_screnn.dart';
import 'package:sample_provider/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //final themeChanger= Provider.of<ThemeChangeProvider>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_) => CountProvider() ),
        ChangeNotifierProvider(create:(_) => ExampleOneProvider() ),
        ChangeNotifierProvider(create:(_) => FavouriteItemProvider() ),
        ChangeNotifierProvider(create:(_) => ThemeChangeProvider() ),
        ChangeNotifierProvider(create:(_) => AuthProvider() ),

      ],
      
      child:  Builder(builder: (BuildContext context){
        final themeChanger = Provider.of<ThemeChangeProvider>(context);
        return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode:themeChanger.themeMode ,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
        primaryColor: Colors.red
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.purple,
        primarySwatch: Colors.purple,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal
        ),
        iconTheme: IconThemeData(
          color: Colors.pink
         )
      ),
      home:LoginScreen(),
    );
      }));
    
  }
}

