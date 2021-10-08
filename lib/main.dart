import 'package:flutter/material.dart';
import 'package:responsiveguide/responsive_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        desktop: buildText(context, 'Desktop'),
        mobile_horizontal: buildText(context, 'Mobile Horizontal'),
        mobile_vertical: buildText(context, 'Mobile Vertical'),
        tablet_horizontal: buildText(context, 'Tablet Horizontal'),
        tablet_vertical: buildText(context, 'Tablet Vertical'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Text buildText(BuildContext context, String title) =>
      Text(title, style: Theme.of(context).textTheme.headline2);
}
