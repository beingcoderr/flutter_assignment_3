// To parse this JSON data, do
//
//     final portfolioDataModel = portfolioDataModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_assignment_3/app/common/utils.dart';

List<PortfolioDataModel> portfolioDataModelFromJson(String str) =>
    List<PortfolioDataModel>.from(
        json.decode(str).map((x) => PortfolioDataModel.fromJson(x)));

String portfolioDataModelToJson(List<PortfolioDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PortfolioDataModel {
  PortfolioDataModel({
    required this.title,
    required this.amount,
    required this.percentage,
    required this.sign,
    required this.image,
  });

  String title;
  String amount;
  String percentage;
  SignEnum sign;
  String image;

  factory PortfolioDataModel.fromJson(Map<String, dynamic> json) =>
      PortfolioDataModel(
        title: json["title"],
        amount: json["amount"],
        percentage: json["percentage"],
        sign: getSignEnum(json["sign"]),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "amount": amount,
        "percentage": percentage,
        "sign": sign,
        "image": image,
      };
}
