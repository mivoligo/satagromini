import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:satagromini/table/data/elements.dart';

class TablePage extends StatefulWidget {
  const TablePage({super.key});

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  int? sortColumnIndex;
  bool sortAscending = true;

  // void _sort<T>(
  //     Comparable<T> Function(Dessert d) getField,
  //     int columnIndex,
  //     bool ascending,
  //     ) {
  //   _dessertsDataSource.sort<T>(getField, ascending);
  //   setState(() {
  //     sortColumnIndex = columnIndex;
  //     sortAscending = ascending;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Table'),
      ),
      body: DataTable2(
        columns: [
          const DataColumn2(label: Text('Element'), size: ColumnSize.M),
          ...elementsData.indexed.map(
            (indexedList) => DataColumn2(
              label: Text('${indexedList.$1 + 1}'),
              numeric: true,
              onSort: (columnIndex, ascending) {},
            ),
          ),
        ],
        rows: [
          ...elementsData.map(
            (element) => DataRow2(cells: [
              DataCell(Text(element.name)),
              DataCell(Text(element.atomicNumber.toString())),
              DataCell(Text(element.weight.toString())),
              DataCell(Text(element.density.toString())),
              DataCell(Text(element.meltingPoint.toString())),
              DataCell(Text(element.boilingPoint.toString())),
              DataCell(Text(element.heatCapacity.toString())),
              DataCell(Text(element.electroNegativity.toString())),
              DataCell(Text(element.abundance.toString())),
            ]),
          )
        ],
        columnSpacing: 12,
        fixedTopRows: 1,
        fixedLeftColumns: 1,
        headingRowHeight: 48,
        headingRowColor: const WidgetStatePropertyAll(Colors.lightBlue),
        fixedColumnsColor: Colors.lightGreen,
        isHorizontalScrollBarVisible: true,
        minWidth: 700,
      ),
    );
  }
}
