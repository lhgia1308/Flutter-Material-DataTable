import 'package:flutter/material.dart';
import 'package:flutter_material_datatable_ex/constants.dart';
import 'package:flutter_material_datatable_ex/models/country.dart';
import 'package:flutter_material_datatable_ex/widgets/flag_widget.dart';
import 'package:flutter_material_datatable_ex/widgets/scrollable_widget.dart';

import '../../../utils.dart';

class TestDataTable extends StatefulWidget {
  const TestDataTable({Key key}) : super(key: key);

  @override
  State<TestDataTable> createState() => _TestDataTableState();
}

class _TestDataTableState extends State<TestDataTable> {
  List<Country> countries = [];
  List<Country> selectedCountries = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  Future init() async {
    final countries = await Utils.loadCountries();

    setState(() => this.countries = countries);
    // print(countries);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScrollableWidget(child: buildDataTable())
        // PaginatedDataTable(
        //     header: const Text("Header Text"),
        //     rowsPerPage: 4,
        //     columns: const [
        //       DataColumn(label: Text("Header A")),
        //       DataColumn(label: Text("Header B")),
        //       DataColumn(label: Text("Header C")),
        //       DataColumn(label: Text("Header D")),
        //     ],
        //     source: _DataSource(context))
      ],
    );
  }

  Widget buildDataTable() {
    final columns = ["Flag", "Name", "Native Name"];

    return DataTable(columns: getColumns(columns), rows: getRows(countries));
  }

  List<DataRow> getRows(List<Country> countries) =>
      countries.map((Country country) => DataRow(
              selected: selectedCountries.contains(country),
              onSelectChanged: (isSelected) => setState(() {
                    final isAdding = isSelected != null && isSelected;
                    isAdding
                        ? selectedCountries.add(country)
                        : selectedCountries.remove(country);
                  }),
              cells: [
                DataCell(
                  FlagWidget(urlImage: urlCountries + country.code + ".svg"),
                ),
                DataCell(Text(country.name)),
                DataCell(Text(country.nativeName)),
              ]));

  List<DataColumn> getColumns(List<String> columns) =>
      columns.map((String column) => DataColumn(label: Text(column))).toList();
}
