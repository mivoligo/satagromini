import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:satagromini/table/data/elements.dart';

class TablePage extends StatelessWidget {
  const TablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Table'),
      ),
      body: DataTable2(
        columns: [
          const DataColumn2(label: Text('Element'), size: ColumnSize.M),
          ...elementsData.values.first.indexed.map(
            (indexedList) => DataColumn2(
              label: Text('${indexedList.$1 + 1}'),
              numeric: true,
              onSort: (columnIndex, ascending) {},
            ),
          )
        ],
        rows: elementsData.entries
            .map(
              (entry) => DataRow2(
                cells: [
                  DataCell(Text(entry.key)),
                  ...entry.value.map(
                    (doubleValue) => DataCell(Text(doubleValue.toString())),
                  )
                ],
              ),
            )
            .toList(growable: false),
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
