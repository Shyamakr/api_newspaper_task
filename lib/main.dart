import 'package:api_newspaper_task/controller/home_screen_controller/home_screen_controller.dart';
import 'package:api_newspaper_task/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeScreenController())
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
