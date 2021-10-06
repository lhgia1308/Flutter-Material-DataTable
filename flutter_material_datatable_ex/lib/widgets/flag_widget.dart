import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FlagWidget extends StatelessWidget {
  final String urlImage;

  const FlagWidget({Key key, this.urlImage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      urlImage,
      height: 30,
      width: 30,
      fit: BoxFit.cover,
    );
  }
}
