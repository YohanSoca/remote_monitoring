import 'package:remote_notifications/models/data_category.dart';
import 'package:flutter/material.dart';

import '../models/battery_state.dart';
import '../models/temperature_state.dart';

class TemperaturesScreen extends StatelessWidget {
  final DataCategory _category;
  const TemperaturesScreen(this._category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TemperaturesGrid();
  }
}

class TemperaturesGrid extends StatelessWidget {
  const TemperaturesGrid({Key? key}) : super(key: key);

  final List<TemperatureState> _temperatures = const [
    TemperatureState(1, 'Engine room', 100),
    TemperatureState(1, 'Ambient', 80),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Temperatures')),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: _temperatures.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1),
          itemBuilder: (context, index) {
            return TileTemperature(_temperatures[index]);
          },
        ),
      ),
    );
  }
}

class TileTemperature extends StatelessWidget {
  final TemperatureState _temperatures;
  const TileTemperature(this._temperatures, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          _openDataScreen(context, _temperatures);
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
                  padding: const EdgeInsets.only(right: 100),
                  child: Text(
                    _temperatures.name,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _temperatures.temperarure.toString(),
                style: const TextStyle(fontSize: 100),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  void _openDataScreen(BuildContext context, TemperatureState category) {}
}
