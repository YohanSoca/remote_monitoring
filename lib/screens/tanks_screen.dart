import 'package:flutter/material.dart';
import 'package:remote_notifications/models/data_category.dart';

class TanksScreen extends StatelessWidget {
  final DataCategory _dataCategory;
  const TanksScreen(this._dataCategory, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tanks'),
      ),
      body: Column(
        children: const [Text('Tanks level')],
      ),
    );
  }
}
