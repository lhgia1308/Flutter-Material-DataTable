import 'package:flutter/material.dart';
import 'package:flutter_material_datatable_ex/constants.dart';
import 'package:flutter_material_datatable_ex/main.dart';
import 'package:flutter_material_datatable_ex/models/country.dart';
import 'package:flutter_material_datatable_ex/widgets/flag_widget.dart';
import 'package:flutter_material_datatable_ex/widgets/scrollable_widget.dart';
import 'package:provider/src/provider.dart';

import '../../../utils.dart';

class TestDataTable extends StatefulWidget {
  const TestDataTable({Key key}) : super(key: key);

  @override
  State<TestDataTable> createState() => _TestDataTableState();
}

class _TestDataTableState extends State<TestDataTable> {
  List<Country> countries = [];
  List<Country> selectedCountries = [];
  DataTableSource _data;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    final countries = await Utils.loadCountries();

    setState(() => this.countries = countries);
    // print(countries[0].name);
  }

  @override
  Widget build(BuildContext context) {
    // final _provider = context.watch<UserDataNotifier>();
    return Column(
      children: [
        // ScrollableWidget(child: buildDataTable()),
        ScrollableWidget(child: Text("fsfsfdsf")),
        buildDataTable()
      ],
    );
  }

  Widget buildDataTable() {
    final columns = ["Flag", "Name", "Native Name"];
    // return DataTable(
    //   headingTextStyle: TextStyle(fontSize: defaultFontSize, color: primaryColor, fontWeight: FontWeight.bold),
    //   columns: getColumns(columns),
    //   rows: getRows(countries)
    // );
    _data = MyData(countries: this.countries, selectedCountries: this.selectedCountries);
    
    return PaginatedDataTable(
            header: const Text("Header Text"),
            // showCheckboxColumn: true,
            horizontalMargin: 15,
            rowsPerPage: 10,
            columns: getColumns(columns),
            source: _data
          );
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
                DataCell(Text('${country.name}')),
                DataCell(Text('${country.native}')),
              ])).toList();

  List<DataColumn> getColumns(List<String> columns) =>
      columns.map((String column) => DataColumn(
        label: Text(column)
        )
      ).toList();
}
class MyData extends DataTableSource{
  List<Country> countries;
  List<Country> selectedCountries;
  MyData({Key key, this.countries, this.selectedCountries});
  @override
  DataRow getRow(int index) {
    return DataRow(
      selected: selectedCountries.contains(countries[index]),
      onSelectChanged: (isSelected) => () {
        print('fsdfsd $isSelected');
                    final isAdding = isSelected != null && isSelected;
                    isAdding
                        ? selectedCountries.add(countries[index])
                        : selectedCountries.remove(countries[index]);
                        print(isSelected);
                  },
      cells: [
        DataCell(
                  FlagWidget(urlImage: urlCountries + '${countries[index].code}' + ".svg"),
        ),
        DataCell(Text('${countries[index].name}')),
        DataCell(Text('${countries[index].native}')),
      ]
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => countries.length;

  @override
  int get selectedRowCount => 0;

}