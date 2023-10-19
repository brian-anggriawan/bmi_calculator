import 'package:flutter/material.dart';
import 'views/input_page.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Color(0XFF0A0E21),
          secondary: Colors.purple,
        ),
        scaffoldBackgroundColor: Color(0XFF0A0E21),
      ),
      // initialRoute: '/',
      // routes: customRoutes,
      home: InputPage(),
    );
  }
}
