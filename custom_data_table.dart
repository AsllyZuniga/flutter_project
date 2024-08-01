import 'package:flutter/material.dart';

class CustomDataTable extends StatefulWidget {
  final List<Map<String, dynamic>> data;
  final List<String> headers;
  final Function(int) onEdit;

  const CustomDataTable({
    Key? key,
    required this.data,
    required this.headers,
    required this.onEdit,
  }) : super(key: key);

  @override
  State<CustomDataTable> createState() => _CustomDataTableState();
}

class _CustomDataTableState extends State<CustomDataTable> {
  @override
  Widget build(BuildContext context) {
    return DataTable(    
      columnSpacing: 20,
      columns: _buildColumns(),
      rows: _buildRows(),
      headingRowColor: MaterialStateColor.resolveWith(
          (states) => Colors.blue.shade100.withOpacity(0.5)),
      dataRowColor: MaterialStateColor.resolveWith(
          (states) => states.contains(MaterialState.selected)
              ? Colors.blue.shade50.withOpacity(0.5)
              : Colors.white),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        color: Colors.transparent,
        boxShadow: [],
      ),
    );
  }

  List<DataColumn> _buildColumns() {
    return widget.headers.map((header) {
      return DataColumn(
        label: Text(
          header,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      );
    }).toList();
  }

  List<DataRow> _buildRows() {
    return List<DataRow>.generate(
      widget.data.length,
      (index) {
        List<DataCell> cells = widget.headers.map((header) {
          var entryValue = widget.data[index][header.toLowerCase()] ?? '';
          if (header == 'Acciones') {
            return DataCell(
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.blue),
                    onPressed: () => widget.onEdit(index),
                  ),
                ],
              ),
            );
          }
          return DataCell(Text(entryValue.toString()));
        }).toList();
        return DataRow(cells: cells);
      },
    );
  }
}