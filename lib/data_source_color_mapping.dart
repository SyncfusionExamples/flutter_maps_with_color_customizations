import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class DataSourceColorMapping extends StatefulWidget {
  const DataSourceColorMapping({super.key});

  @override
  State<DataSourceColorMapping> createState() => _DataSourceColorMappingState();
}

class _DataSourceColorMappingState extends State<DataSourceColorMapping> {
  late List<DataModel> _data;
  late MapShapeSource _dataSource;

  @override
  void initState() {
    // maps with color in data source itself.
    _data = <DataModel>[
      DataModel('Chandigarh', const Color.fromARGB(255, 112, 30, 24)),
      DataModel('Tamil Nadu', const Color.fromARGB(255, 138, 82, 18)),
      DataModel('Kerala', const Color.fromARGB(255, 101, 228, 42)),
      DataModel('Karnataka', const Color.fromARGB(255, 187, 138, 53)),
      DataModel('Assam', const Color.fromARGB(255, 94, 168, 10)),
      DataModel('Goa', const Color.fromARGB(255, 132, 172, 121)),
      DataModel('Orissa', const Color.fromARGB(255, 157, 186, 76)),
      DataModel('Gujarat', const Color.fromARGB(255, 12, 120, 10)),
      DataModel('Delhi', const Color.fromARGB(255, 149, 247, 2)),
      DataModel('Himachal Pradesh', const Color.fromARGB(255, 180, 234, 224)),
      DataModel('Haryana', const Color.fromARGB(255, 54, 244, 219)),
      DataModel('Lakshadweep', const Color.fromARGB(255, 51, 169, 180)),
      DataModel(
          'Dadra and Nagar Haveli', const Color.fromARGB(255, 9, 227, 206)),
      DataModel('Maharashtra', const Color.fromARGB(255, 2, 94, 96)),
      DataModel(
          'Andaman and Nicobar', const Color.fromARGB(255, 157, 175, 234)),
      DataModel('Manipur', const Color.fromARGB(255, 54, 108, 244)),
      DataModel('Nagaland', const Color.fromARGB(255, 12, 54, 241)),
      DataModel('Meghalaya', const Color.fromARGB(255, 2, 32, 87)),
      DataModel('Punjab', const Color.fromARGB(255, 54, 64, 202)),
      DataModel('Rajasthan', const Color.fromARGB(255, 206, 179, 218)),
      DataModel('Uttar Pradesh', const Color.fromARGB(255, 116, 45, 179)),
      DataModel('Uttaranchal', const Color.fromARGB(255, 50, 63, 108)),
      DataModel('Jharkhand', const Color.fromARGB(255, 142, 10, 133)),
      DataModel('West Bengal', const Color.fromARGB(255, 101, 46, 99)),
      DataModel('Bihar', const Color.fromARGB(255, 138, 199, 46)),
      DataModel('Sikkim', const Color.fromARGB(255, 5, 124, 17)),
      DataModel('Chhattisgarh', const Color.fromARGB(255, 76, 1, 41)),
      DataModel('Madhya Pradesh', Colors.red),
      DataModel('Puducherry', Colors.red),
      DataModel('Arunachal Pradesh', const Color.fromARGB(255, 253, 6, 245)),
      DataModel('Mizoram', const Color.fromARGB(255, 182, 84, 14)),
      DataModel('Tripura', const Color.fromARGB(255, 44, 153, 159)),
      DataModel('Daman and Diu', const Color.fromARGB(255, 60, 5, 15)),
      DataModel('Telangana', const Color.fromARGB(255, 125, 5, 27)),
      DataModel('Andhra Pradesh', const Color.fromARGB(255, 235, 8, 50)),
      DataModel('Jammu & Kashmir', const Color.fromARGB(255, 182, 42, 123)),
    ];

    _dataSource = MapShapeSource.asset(
      'assets/india.json',
      shapeDataField: 'name',
      dataCount: _data.length,
      primaryValueMapper: (int index) => _data[index].state,
      shapeColorValueMapper: (int index) => _data[index].color,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          width: MediaQuery.of(context).size.width * 0.75,
          child: SfMaps(
            layers: <MapShapeLayer>[
              MapShapeLayer(
                source: _dataSource,
                legend: const MapLegend(
                  MapElement.shape,
                  title: Text('Individual state Representation',
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

class DataModel {
  DataModel(this.state, this.color);
  String state;
  Color color;
}
