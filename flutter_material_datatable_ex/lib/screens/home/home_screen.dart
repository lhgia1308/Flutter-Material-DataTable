import 'package:flutter/material.dart';

import 'components/data_table.dart';
import 'components/header.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          Header(),
          const TestDataTable(),
        ]),
      ),
    );
  }
}
