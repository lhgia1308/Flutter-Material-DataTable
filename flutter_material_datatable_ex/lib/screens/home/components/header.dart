import 'package:flutter/material.dart';
import 'package:flutter_material_datatable_ex/constants.dart';
import 'package:flutter_material_datatable_ex/controllers/menu_controller.dart';
import 'package:flutter_material_datatable_ex/responsive.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
              onPressed: context.read<MenuController>().controlMenu,
              icon: Icon(Icons.menu)),
        if (!Responsive.isMobile(context))
          Container(
            margin: EdgeInsets.only(left: defaultPadding),
            child: Text(
              "Dashboard",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(child: SearchField()),
        ProfileCard()
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: defaultPadding),
      padding: EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding / 2),
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.white24)),
      child: Row(
        children: [
          Image.asset("assets/images/profile_pic.png"),
          if (!Responsive.isMobile(context))
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Text("Angelina Joli"),
            ),
          PopupMenuButton(
              // color: Colors.yellowAccent,
              shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              icon: Icon(Icons.keyboard_arrow_down),
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                    const PopupMenuItem(
                      child: ListTile(
                        //leading: Icon(Icons.add),
                        horizontalTitleGap: 0.0,
                        selected: false,
                        title: Text('Angelina Joli'),
                      ),
                    ),
                  ])
          // FloatingActionButton(
          //   onPressed: () {
          //     print('clicked Angelina Joli');
          //   },
          //   child: Icon(Icons.keyboard_arrow_down),
          // )
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: defaultPadding),
      child: TextField(
          decoration: InputDecoration(
              hintText: "Search",
              fillColor: secondaryColor,
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              suffixIcon: InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(defaultPadding * 0.8),
                  margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: SvgPicture.asset("assets/icons/Search.svg"),
                ),
              ))),
    );
  }
}
