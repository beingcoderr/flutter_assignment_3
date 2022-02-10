enum SignEnum { positive, negative }
SignEnum getSignEnum(String sign) {
  return SignEnum.values.firstWhere((element) => element.name == sign);
}
