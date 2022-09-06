import 'package:remote_notifications/models/data_category.dart';
import 'package:flutter/material.dart';
import 'package:remote_notifications/screens/pms_screen.dart';
import 'package:remote_notifications/screens/tanks_screen.dart';
import 'package:remote_notifications/screens/temperatures_screen.dart';

import 'batteries_screen.dart';
import 'heading_screen.dart';
import 'location_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DataCategoriesGrid();
  }
}

class DataCategoriesGrid extends StatelessWidget {
  const DataCategoriesGrid({Key? key}) : super(key: key);

  final List<DataCategory> _categories = const [
    DataCategory(1, 'PMS', 'Shore power'),
    DataCategory(2, 'Location', 'STBD Generator'),
    DataCategory(3, 'Temperatures', 'PORT Generator'),
    DataCategory(4, 'Tanks', 'Tank levels'),
    DataCategory(4, 'Batteries', 'Tank levels'),
    DataCategory(4, 'Heading', 'Tank levels')
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: GridView.builder(
        itemCount: _categories.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return TileCategory(_categories[index]);
        },
      ),
    );
  }
}

class TileCategory extends StatelessWidget {
  final DataCategory _category;
  const TileCategory(this._category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          _openDataScreen(context, _category);
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.orange.withOpacity(0.7)),
          alignment: AlignmentDirectional.center,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            InkWell(
              child: Container(
                child: Text(
                  _category.name,
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            _category.name == 'PMS'
                ? const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.power,
                      size: 60,
                    ),
                  )
                : _category.name == 'Location'
                    ? const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.location_on,
                          size: 60,
                        ),
                      )
                    : _category.name == 'Temperatures'
                        ? const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.thermostat,
                              size: 60,
                            ),
                          )
                        : _category.name == 'Tanks'
                            ? const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.water,
                                  size: 60,
                                ),
                              )
                            : _category.name == 'Batteries'
                                ? const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.battery_charging_full,
                                      size: 60,
                                    ),
                                  )
                                : const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.compass_calibration,
                                      size: 60,
                                    ),
                                  )
          ]),
        ),
      ),
    );
  }

  void _openDataScreen(BuildContext context, DataCategory category) {
    if (category.name == 'Temperatures') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TemperaturesScreen(category)));
    }
    if (category.name == 'PMS') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => PMSScreen(category)));
    }
    if (category.name == 'Location') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => LocationScreen(category)));
    }
    if (category.name == 'Tanks') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => TanksScreen(category)));
    }
    if (category.name == 'Batteries') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => BatteriesScreen(category)));
    }
    if (category.name == 'Heading') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => HeadingScreen(category)));
    }
  }
}
