import 'package:flutter/material.dart';
import 'package:flutter_material_datatable_ex/controllers/menu_controller.dart';
import 'package:flutter_material_datatable_ex/responsive.dart';
import 'package:flutter_material_datatable_ex/screens/home/home_screen.dart';
import 'package:provider/src/provider.dart';

import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isDesktop(context)) Expanded(child: SideMenu()),
          // SideMenu(),
          Expanded(flex: 5, child: HomeScreen())
        ],
      )),
    );
  }
}
