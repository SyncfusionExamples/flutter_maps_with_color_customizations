import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class EqualColorMapping extends StatefulWidget {
  const EqualColorMapping({super.key});

  @override
  State<EqualColorMapping> createState() => _EqualColorMappingState();
}

class _EqualColorMappingState extends State<EqualColorMapping> {
  late List<EqualModel> _equalData;
  late MapShapeSource _dataSource;

  @override
  void initState() {
    _equalData = <EqualModel>[
      EqualModel('Manipur', '0.5'),
      EqualModel('Nagaland', '0.5'),
      EqualModel('Meghalaya', '0.5'),
      EqualModel('Sikkim', '0.5'),
      EqualModel('Mizoram', '0.5'),
      EqualModel('Tripura', '0.5'),
      EqualModel('Daman and Diu', '0.5'),
      EqualModel('Dadra and Nagar Haveli', '1'),
      EqualModel('Arunachal Pradesh', '1'),
      EqualModel('Lakshadweep', '1'),
      EqualModel('Andaman and Nicobar', '1'),
      EqualModel('Goa', '1'),
      EqualModel('Himachal Pradesh', '3'),
      EqualModel('Uttaranchal', '3'),
      EqualModel('Assam', '5'),
      EqualModel('Chhattisgarh', '5'),
      EqualModel('Orissa', '8'),
      EqualModel('Bihar', '8'),
      EqualModel('Puducherry', '10'),
      EqualModel('Delhi', '10'),
      EqualModel('Chandigarh', '16'),
      EqualModel('Karnataka', '16'),
      EqualModel('Rajasthan', '16'),
      EqualModel('West Bengal', '16'),
    ];

    _dataSource = MapShapeSource.asset(
      'assets/india.json',
      shapeDataField: 'name',
      dataCount: _equalData.length,
      primaryValueMapper: (int index) => _equalData[index].state,
      shapeColorValueMapper: (int index) => _equalData[index].value,
      shapeColorMappers: const [
        MapColorMapper(
            value: '0.5',
            color: Color.fromARGB(255, 246, 251, 122),
            text: '0.5%'),
        MapColorMapper(
            value: '1', color: Color.fromARGB(255, 234, 100, 23), text: '1%'),
        MapColorMapper(
            value: '3', color: Color.fromARGB(255, 27, 73, 225), text: '3%'),
        MapColorMapper(
            value: '5', color: Color.fromARGB(255, 10, 237, 101), text: '5'),
        MapColorMapper(
            value: '8', color: Color.fromARGB(255, 24, 222, 229), text: '8%'),
        MapColorMapper(
            value: '10', color: Color.fromARGB(255, 244, 74, 193), text: '10%'),
        MapColorMapper(
            value: '16', color: Color.fromARGB(255, 223, 81, 88), text: '16%'),
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
                  title: Text('Population in Percentage',
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

class EqualModel {
  EqualModel(this.state, this.value);
  String state;
  String value;
}
