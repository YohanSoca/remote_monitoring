import 'package:flutter/material.dart';
import 'package:remote_notifications/models/data_category.dart';

class LocationScreen extends StatelessWidget {
  final DataCategory _dataCategory;
  const LocationScreen(this._dataCategory, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Position'),
      ),
      body: Column(
        children: const [Text('Location Screen')],
      ),
    );
  }
}
