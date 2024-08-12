import 'package:flutter/material.dart';

import 'range_color_mapping.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // To render the range color mapping.
      home: RangeColorMapping(),

      // Uncomment the below line to render the equal color mapping.
      // home: EqualColorMapping(),

      // Uncomment the below line to render the data source color mapping.
      // home: DataSourceColorMapping(),
    );
  }
}
