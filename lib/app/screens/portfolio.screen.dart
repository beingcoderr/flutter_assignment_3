// import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_3/app/models/portfolio.model.dart';

class PortfolioScreen extends StatelessWidget {
  static const name = "/portfolio_screen";
  const PortfolioScreen({
    Key? key,
  }) : super(key: key);

  static const List<String> _filters = ["1D", "7D", "1M", "1Y", "5Y", "All"];

  static const _selectedFilter = 1;
  @override
  Widget build(BuildContext context) {
    final PortfolioDataModel portfolioDataModel =
        ModalRoute.of(context)?.settings.arguments as PortfolioDataModel;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: Container(
            margin: const EdgeInsets.only(left: 12),
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            child: const BackButton(color: Colors.black)),
        title: const Text(
          "My Portfolio",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            child: IconButton(
              color: Colors.black,
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            ),
          )
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 150,
            child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.red,
                  side: const BorderSide(
                    color: Colors.red,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {},
                child: const Text("Sell")),
          ),
          SizedBox(
            width: 150,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  side: const BorderSide(
                    color: Colors.green,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {},
                child: const Text("Buy")),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Hero(
                    tag: portfolioDataModel.title,
                    child: Image.asset(
                      "assets/symbols/${portfolioDataModel.image}",
                      height: 100,
                      width: 100,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "\$${portfolioDataModel.amount}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                    height: 30,
                    decoration: ShapeDecoration(
                        shape: const StadiumBorder(),
                        color: Colors.green.withOpacity(.15)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
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
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: (size.height / 100) * 40,
              child: LineChart(mainData()),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _filters.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _selectedFilter == index
                          ? Colors.green[50]
                          : Colors.white,
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
                Container(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  width: (size.width / 100) * 45,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Open"),
                          Text(
                            "153.74",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("High"),
                          Text(
                            "154.61",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Low"),
                          Text(
                            "153.10",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  width: (size.width / 100) * 45,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Vol"),
                          Text(
                            "52.87m",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("P/E"),
                          Text(
                            "30.21",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Mkt Cap"),
                          Text(
                            "2.311`",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(
        show: false,
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          colors: [Colors.green],
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
              show: true,
              colors: [Colors.green, Colors.green[100]!, Colors.white],
              gradientFrom: Offset.zero,
              gradientTo: const Offset(0, 1)),
        ),
      ],
    );
  }
}
