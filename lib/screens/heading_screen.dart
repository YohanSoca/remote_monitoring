import 'package:flutter/material.dart';
import 'package:remote_notifications/models/data_category.dart';

class HeadingScreen extends StatelessWidget {
  final DataCategory _dataCategory;
  const HeadingScreen(this._dataCategory, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Heading'),
      ),
      body: Column(
        children: const [Text('Vessel heading')],
      ),
    );
  }
}
