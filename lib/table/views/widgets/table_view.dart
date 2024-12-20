import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart' hide Element;
import 'package:satagromini/table/data/elements.dart';
import 'package:satagromini/table/models/element.dart';

class TableView extends StatefulWidget {
  const TableView({super.key});

  @override
  State<TableView> createState() => _TableViewState();
}

class _TableViewState extends State<TableView> {
  int? sortColumnIndex;
  bool sortAscending = true;
  List<Element> listOfElements = [...elementsData];

  @override
  Widget build(BuildContext context) {
    return DataTable2(
      bottomMargin: 0,
      columns: [
        DataColumn2(
          label: const Text('Element'),
          size: ColumnSize.M,
          fixedWidth: 80,
          onSort: sort,
        ),
        ...elementsData.indexed.map(
          (indexedList) => DataColumn2(
            label: Text('${indexedList.$1 + 1}'),
            // numeric: true,
            onSort: sort,
          ),
        ),
      ],
      rows: [
        ...listOfElements.map(
          (element) => DataRow2(
            cells: [
              DataCell(Text(element.name)),
              DataCell(Text(element.atomicNumber.toString())),
              DataCell(Text(element.weight.toString())),
              DataCell(Text(element.density.toString())),
              DataCell(Text(element.meltingPoint.toString())),
              DataCell(Text(element.boilingPoint.toString())),
              DataCell(Text(element.heatCapacity.toString())),
              DataCell(Text(element.electroNegativity.toString())),
              DataCell(Text(element.abundance.toString())),
            ],
          ),
        )
      ],
      columnSpacing: 12,
      fixedTopRows: 1,
      fixedLeftColumns: 1,
      headingRowHeight: 48,
      headingRowColor: const WidgetStatePropertyAll(Colors.lightBlue),
      fixedColumnsColor: Colors.lightGreen,
      isHorizontalScrollBarVisible: true,
      sortAscending: sortAscending,
      sortColumnIndex: sortColumnIndex,
      minWidth: 700,
      border: TableBorder.all(width: 1.0, color: Colors.black87),
    );
  }

  void sort(int columnIndex, bool ascending) {
    setState(() {
      sortAscending = ascending;
      sortColumnIndex = columnIndex;
      listOfElements = listOfElements
        ..sort(
          (a, b) {
            final sortingValue = switch (columnIndex) {
              1 => ascending
                  ? a.atomicNumber.compareTo(b.atomicNumber)
                  : b.atomicNumber.compareTo(a.atomicNumber),
              2 => ascending
                  ? a.weight.compareTo(b.weight)
                  : b.weight.compareTo(a.weight),
              3 => ascending
                  ? a.density.compareTo(b.density)
                  : b.density.compareTo(a.density),
              4 => ascending
                  ? a.meltingPoint.compareTo(b.meltingPoint)
                  : b.meltingPoint.compareTo(a.meltingPoint),
              5 => ascending
                  ? a.boilingPoint.compareTo(b.boilingPoint)
                  : b.boilingPoint.compareTo(a.boilingPoint),
              6 => ascending
                  ? a.heatCapacity.compareTo(b.heatCapacity)
                  : b.heatCapacity.compareTo(a.heatCapacity),
              7 => ascending
                  ? a.electroNegativity.compareTo(b.electroNegativity)
                  : b.electroNegativity.compareTo(a.electroNegativity),
              8 => ascending
                  ? a.abundance.compareTo(b.abundance)
                  : b.abundance.compareTo(a.abundance),
              _ =>
                ascending ? a.name.compareTo(b.name) : b.name.compareTo(a.name),
            };
            return sortingValue;
          },
        );
    });
  }
}
