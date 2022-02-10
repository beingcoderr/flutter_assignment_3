// To parse this JSON data, do
//
//     final marketModel = marketModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_assignment_3/app/common/utils.dart';

List<CoinModel> marketModelFromJson(String str) =>
    List<CoinModel>.from(json.decode(str).map((x) => CoinModel.fromJson(x)));

String marketModelToJson(List<CoinModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CoinModel {
  CoinModel({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.percentage,
    required this.sign,
    required this.image,
  });

  String title;
  String subtitle;
  String amount;
  String percentage;
  SignEnum sign;
  String image;

  factory CoinModel.fromJson(Map<String, dynamic> json) => CoinModel(
        title: json["title"],
        subtitle: json["subtitle"],
        amount: json["amount"],
        percentage: json["percentage"],
        sign: getSignEnum(json["sign"]),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "amount": amount,
        "percentage": percentage,
        "sign": sign,
        "image": image,
      };
}
