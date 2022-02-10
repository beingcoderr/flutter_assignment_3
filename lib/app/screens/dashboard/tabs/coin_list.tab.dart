import 'package:flutter/material.dart';
import 'package:flutter_assignment_3/app/common/widgets.dart';
import 'package:flutter_assignment_3/app/providers/market.provider.dart';
import 'package:provider/provider.dart';

class CoinListTab extends StatelessWidget {
  const CoinListTab({Key? key}) : super(key: key);

  static const List<String> _filters = [
    "All",
    "24h",
    "Top 100",
    "Markey Cap",
    "Top 300",
    "Market Capital"
  ];

  static const _selectedFilter = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 32, 12, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Coin List",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.green[100], shape: BoxShape.circle),
                  child: IconButton(
                      color: Colors.green[900],
                      onPressed: () {},
                      icon: const Icon(Icons.search)))
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _filters.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                  margin: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: _selectedFilter == index
                        ? Colors.green[50]
                        : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(_filters[index],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _selectedFilter == index
                              ? Colors.green
                              : Colors.grey)),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Market is Uptrend",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    "In the past 24hrs",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Colors.grey),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
                decoration: ShapeDecoration(
                    shape: const StadiumBorder(),
                    color: Colors.green.withOpacity(.15)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.arrow_drop_up,
                      color: Colors.green,
                      size: 34,
                    ),
                    Text(
                      "9.17%",
                      style: TextStyle(color: Colors.green, fontSize: 14),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 12),
          Consumer<MarketProvider>(
            builder: (context, marketProvider, child) {
              final coinList = marketProvider.coinModels;
              return Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: coinList?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CoinListItem(coinModel: coinList![index]);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
