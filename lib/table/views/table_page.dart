import 'package:flutter/material.dart' hide Element;
import 'package:satagromini/table/views/widgets/legend.dart';
import 'package:satagromini/table/views/widgets/table_view.dart';

class TablePage extends StatelessWidget {
  const TablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Table'),
      ),
      body: const Column(
        children: [
          Expanded(
            child: TableView(),
          ),
          Expanded(
            child: Legend(),
          ),
        ],
      ),
    );
  }
}
