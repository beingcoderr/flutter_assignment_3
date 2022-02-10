import 'package:flutter/material.dart';
import 'package:flutter_assignment_3/app/common/utils.dart';
import 'package:flutter_assignment_3/app/models/market.model.dart';
import 'package:flutter_assignment_3/app/models/portfolio.model.dart';
import 'package:flutter_assignment_3/app/screens/portfolio.screen.dart';

class IconButtonLabel extends StatelessWidget {
  final IconData iconData;
  final String label;
  final double iconSize;
  final VoidCallback? onPressed;
  const IconButtonLabel(
      {Key? key,
      required this.iconData,
      required this.label,
      this.iconSize = 28,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: onPressed,
              icon: Icon(
                iconData,
                size: iconSize,
              )),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          )
        ],
      ),
    );
  }
}

class PortfolioGridItem extends StatelessWidget {
  final PortfolioDataModel portfolioDataModel;
  const PortfolioGridItem({Key? key, required this.portfolioDataModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(16),
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.pushNamed(context, PortfolioScreen.name,
              arguments: portfolioDataModel);
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          // decoration: BoxDecoration(
          //   color: Colors.white,
          //   borderRadius: BorderRadius.circular(16),
          // ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: portfolioDataModel.title,
                child: Image.asset(
                  "assets/symbols/${portfolioDataModel.image}",
                  height: 40,
                  width: 40,
                ),
              ),
              const SizedBox(height: 12),
              Text(portfolioDataModel.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("\$${portfolioDataModel.amount}"),
                      Text(
                        portfolioDataModel.percentage,
                        style: TextStyle(
                            color: portfolioDataModel.sign == SignEnum.positive
                                ? Colors.green
                                : Colors.red),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: portfolioDataModel.sign == SignEnum.positive
                            ? Colors.green[100]
                            : Colors.red[100]),
                    child: Icon(
                      portfolioDataModel.sign == SignEnum.positive
                          ? Icons.trending_up
                          : Icons.trending_down,
                      color: portfolioDataModel.sign == SignEnum.positive
                          ? Colors.green[900]!
                          : Colors.red[900]!,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CoinListItem extends StatelessWidget {
  final CoinModel coinModel;
  const CoinListItem({Key? key, required this.coinModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.fromLTRB(0, 6, 0, 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/symbols/${coinModel.image}",
                height: 40,
                width: 40,
              ),
              const SizedBox(width: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coinModel.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    coinModel.subtitle,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  )
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "\$${coinModel.amount}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Icon(
                    coinModel.sign == SignEnum.positive
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    color: coinModel.sign == SignEnum.positive
                        ? Colors.green[900]!
                        : Colors.red[900]!,
                  ),
                  Text(
                    coinModel.percentage,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: coinModel.sign == SignEnum.positive
                            ? Colors.green
                            : Colors.red),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
