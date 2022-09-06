import 'package:remote_notifications/models/analog_categories.dart';
import 'package:flutter/material.dart';

class AnalogsScreen extends StatelessWidget {
  const AnalogsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BookCategoriesGrid();
  }
}

class BookCategoriesGrid extends StatelessWidget {
  const BookCategoriesGrid({Key? key}) : super(key: key);

  final List<AnalogCategory> _categories = const [
    AnalogCategory(1, 'Shore', 'Shore power'),
    AnalogCategory(2, 'Gen', 'STBD Generator'),
    AnalogCategory(3, 'Gen', 'PORT Generator'),
    AnalogCategory(4, 'Bus', 'Main Bus')
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: GridView.builder(
        itemCount: _categories.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemBuilder: (context, index) {
          return TileCategory(_categories[index]);
        },
      ),
    );
  }
}

class TileCategory extends StatelessWidget {
  final AnalogCategory _category;
  const TileCategory(this._category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(
        _category.name,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.amber, fontSize: 40),
      ),
    );
  }
}
