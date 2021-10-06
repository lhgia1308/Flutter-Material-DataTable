import 'package:meta/meta.dart';

class Country {
  final String code;
  final String name;
  final String native;

  Country({this.code, this.name, this.native});
  factory Country.fromJson(Map<String, dynamic> json) => Country(
      code: json["code"], name: json["name"], native: json["native"]);
}
