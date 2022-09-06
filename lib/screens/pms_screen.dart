import 'package:flutter/material.dart';
import 'package:remote_notifications/models/data_category.dart';

class PMSScreen extends StatelessWidget {
  final DataCategory _dataCategory;
  const PMSScreen(this._dataCategory, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PMS'),
      ),
      body: Column(
        children: const [Text('Power magnament system')],
      ),
    );
  }
}
