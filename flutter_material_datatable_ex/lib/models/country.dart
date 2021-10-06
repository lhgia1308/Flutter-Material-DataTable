import 'package:meta/meta.dart';

class Country {
  final String code;
  final String name;
  final String nativeName;

  Country({this.code, this.name, this.nativeName});
  factory Country.fromJson(Map<String, dynamic> json) => Country(
      code: json["code"], name: json["name"], nativeName: json["nativeName"]);
}
