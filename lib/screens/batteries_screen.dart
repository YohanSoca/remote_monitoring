import 'package:remote_notifications/models/data_category.dart';
import 'package:flutter/material.dart';

import '../models/battery_state.dart';

class BatteriesScreen extends StatelessWidget {
  final DataCategory _category;
  const BatteriesScreen(this._category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BatteriesGrid();
  }
}

class BatteriesGrid extends StatelessWidget {
  const BatteriesGrid({Key? key}) : super(key: key);

  final List<BatteryState> _batteries = const [
    BatteryState(1, 'Sevice', 40),
    BatteryState(1, 'PORT', 30),
    BatteryState(1, 'STBD', 50),
    BatteryState(1, 'Emergency', 20),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Batteries')),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: _batteries.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1),
          itemBuilder: (context, index) {
            return TileBattery(_batteries[index]);
          },
        ),
      ),
    );
  }
}

class TileBattery extends StatelessWidget {
  final BatteryState _battery;
  const TileBattery(this._battery, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          _openDataScreen(context, _battery);
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.orange.withOpacity(0.7)),
          alignment: AlignmentDirectional.center,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            InkWell(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 200),
                  child: Text(
                    _battery.name,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                _battery.level == 10
                    ? Icons.battery_1_bar
                    : _battery.level == 20
                        ? Icons.battery_2_bar
                        : _battery.level == 30
                            ? Icons.battery_3_bar
                            : _battery.level == 40
                                ? Icons.battery_4_bar
                                : _battery.level == 50
                                    ? Icons.battery_5_bar
                                    : Icons.battery_6_bar,
                size: 200,
              ),
            ),
            Text(
              _battery.level.toString() + '%',
              style: TextStyle(fontSize: 30),
            ),
          ]),
        ),
      ),
    );
  }

  void _openDataScreen(BuildContext context, BatteryState category) {}
}
