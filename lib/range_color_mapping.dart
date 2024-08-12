import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class RangeColorMapping extends StatefulWidget {
  const RangeColorMapping({super.key});

  @override
  State<RangeColorMapping> createState() => _RangeColorMappingState();
}

class _RangeColorMappingState extends State<RangeColorMapping> {
  late List<RangeModel> _rangeData;
  late MapShapeSource _dataSource;

  @override
  void initState() {
    // Maps with range color mapping
    _rangeData = <RangeModel>[
      RangeModel('Chandigarh', 67.98),
      RangeModel('Tamil Nadu', 69.72),
      RangeModel('Kerala', 71.27),
      RangeModel('Karnataka', 70.64),
      RangeModel('Assam', 81.56),
      RangeModel('Goa', 76.06),
      RangeModel('Orissa', 74.44),
      RangeModel('Gujarat', 60.13),
      RangeModel('Delhi', 58.69),
      RangeModel('Himachal Pradesh', 70.90),
      RangeModel('Haryana', 64.80),
      RangeModel('Lakshadweep', 84.16),
      RangeModel('Dadra and Nagar Haveli', 71.31),
      RangeModel('Maharashtra', 61.33),
      RangeModel('Andaman and Nicobar', 64.10),
      RangeModel('Manipur', 78.19),
      RangeModel('Nagaland', 57.72),
      RangeModel('Meghalaya', 76.60),
      RangeModel('Punjab', 62.80),
      RangeModel('Rajasthan', 61.53),
      RangeModel('Uttar Pradesh', 56.92),
      RangeModel('Uttaranchal', 57.22),
      RangeModel('Jharkhand', 66.19),
      RangeModel('West Bengal', 79.29),
      RangeModel('Bihar', 56.19),
      RangeModel('Sikkim', 79.88),
      RangeModel('Chhattisgarh', 72.81),
      RangeModel('Madhya Pradesh', 66.87),
      RangeModel('Puducherry', 78.90),
      RangeModel('Arunachal Pradesh', 77.68),
      RangeModel('Mizoram', 56.87),
      RangeModel('Tripura', 80.93),
      RangeModel('Daman and Diu', 71.31),
    ];

    _dataSource = MapShapeSource.asset(
      'assets/india.json',
      shapeDataField: 'name',
      dataCount: _rangeData.length,
      primaryValueMapper: (int index) => _rangeData[index].state,
      shapeColorValueMapper: (int index) => _rangeData[index].count,
      shapeColorMappers: const [
        MapColorMapper(
            from: 50,
            to: 60,
            color: Color.fromARGB(50, 3, 182, 12),
            text: '50% - 60%'),
        MapColorMapper(
            from: 60,
            to: 70,
            color: Color.fromARGB(100, 85, 181, 80),
            text: '60% - 70%'),
        MapColorMapper(
            from: 70,
            to: 80,
            color: Color.fromARGB(150, 37, 170, 84),
            text: '70% - 80%'),
        MapColorMapper(
            from: 80,
            to: 90,
            color: Color.fromARGB(200, 12, 170, 4),
            text: '80% - 90%'),
        MapColorMapper(
            from: 90,
            to: 100,
            color: Color.fromARGB(255, 13, 188, 4),
            text: '90% - 100%'),
      ],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.85,
          width: MediaQuery.of(context).size.width * 0.85,
          child: SfMaps(
            layers: <MapShapeLayer>[
              MapShapeLayer(
                source: _dataSource,
                legend: const MapLegend(
                  MapElement.shape,
                  title: Text('Voting Range in percentage',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  position: MapLegendPosition.right,
                ),
                color: Colors.white,
                strokeColor: const Color.fromARGB(255, 6, 89, 2),
                strokeWidth: 0.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RangeModel {
  RangeModel(this.state, this.count);
  String state;
  double count;
}
