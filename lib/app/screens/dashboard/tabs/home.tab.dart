import 'package:flutter/material.dart';
import 'package:flutter_assignment_3/app/common/widgets.dart';
import 'package:flutter_assignment_3/app/providers/portfolio.provider.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        Container(
          height: (size.height / 100) * 35,
          padding: const EdgeInsets.fromLTRB(16, 30, 16, 0),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.green[600]!,
              Colors.green[400]!,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          )),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome to",
                        style: TextStyle(
                          color: Colors.white.withOpacity(.75),
                          fontSize: 22,
                        ),
                      ),
                      const Text(
                        "CoinPro",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      )
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(.15)),
                    child: IconButton(
                        color: Colors.white,
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: const Icon(Icons.notifications)),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My Balance",
                        style: TextStyle(
                          color: Colors.white.withOpacity(.75),
                          fontSize: 14,
                        ),
                      ),
                      const Text(
                        "\$32,761.65",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.trending_up,
                            color: Colors.white.withOpacity(.9),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            "\$1,896",
                            style:
                                TextStyle(color: Colors.white.withOpacity(.9)),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            "Today's Profit",
                            style: TextStyle(
                              color: Colors.white.withOpacity(.9),
                              fontSize: 12,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
                    decoration: ShapeDecoration(
                        shape: const StadiumBorder(),
                        color: Colors.white.withOpacity(.15)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.arrow_drop_up,
                          color: Colors.white,
                          size: 34,
                        ),
                        Text(
                          "20%",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: (size.height / 100) * 40,
          left: (size.width / 100) * 5,
          width: (size.width / 100) * 90,
          height: (size.height / 100) * 52,
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "My Portfolio",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  TextButton(onPressed: () {}, child: const Text("See all"))
                ],
              ),
              Consumer<PortfolioProvider>(
                builder: (context, portfolioProvider, child) {
                  final portfolio = portfolioProvider.portfolio;
                  return GridView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 12, bottom: 12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: portfolio?.length,
                    itemBuilder: (context, index) {
                      return PortfolioGridItem(
                          portfolioDataModel: portfolio![index]);
                    },
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "News",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  TextButton(onPressed: () {}, child: const Text("See all"))
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: (size.height / 100) * 30,
          left: (size.width / 100) * 5,
          width: (size.width / 100) * 90,
          child: Container(
            padding: const EdgeInsets.fromLTRB(12, 2, 12, 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 4),
                  color: Colors.grey[300]!,
                  spreadRadius: .1,
                  blurRadius: .1,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButtonLabel(
                  iconData: Icons.file_download_outlined,
                  label: "Withdraw",
                  onPressed: () {},
                ),
                IconButtonLabel(
                  iconData: Icons.file_upload_outlined,
                  label: "Deposit",
                  onPressed: () {},
                ),
                IconButtonLabel(
                  iconData: Icons.history,
                  label: "History",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
