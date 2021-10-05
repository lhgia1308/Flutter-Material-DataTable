import 'package:flutter/material.dart';
import 'package:flutter_material_datatable_ex/constants.dart';
import 'package:flutter_material_datatable_ex/controllers/menu_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'screens/main/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Material Datatable",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white),
          canvasColor: secondaryColor),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MenuController())
        ],
        child: MainScreen(),
      ),
    );
  }
}
