// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dlumbiz_clone/main.dart';
import 'package:dlumbiz_clone/model/chart_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardStat extends StatelessWidget {
  String? title, subtitle;
  Widget? left, right;
  DashboardStat({
    required this.title,
    required this.subtitle,
    required this.left,
    required this.right,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ColoredBox(
            color: Colors.black.withValues(alpha: 0.05),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title!, style: kTextStyle(14, isBold: true)),
                  Row(
                    spacing: 4,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(3),
                        child: Icon(Icons.add, size: 8, color: Colors.white),
                      ),
                      Text("New", style: kTextStyle(12, isBold: true)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subtitle!,
                  style: TextStyle(fontSize: 10, color: Colors.grey[400]),
                ),
                const SizedBox(height: 16),
                LinearProgressIndicator(
                  minHeight: 8,
                  value: 0,
                  backgroundColor: Colors.black.withValues(alpha: 0.05),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      left!,
                      SizedBox(
                        height: 50,
                        width: 1,
                        child: ColoredBox(color: Colors.grey[300]!),
                      ),
                      right!,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductStat extends StatefulWidget {
  const ProductStat({super.key});

  @override
  State<ProductStat> createState() => _ProductStatState();
}

class _ProductStatState extends State<ProductStat> {
  final List<ChartData> data = [
    ChartData('Apr', 35),
    ChartData('May', 70),
    ChartData('Jun', 85),
    ChartData('Jul', 65),
    ChartData('Aug', 40),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ColoredBox(
            color: Colors.black.withValues(alpha: 0.05),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Top Selling Product",
                    style: kTextStyle(14, isBold: true),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
            child: SizedBox(
              width: 700,
              height: 200,
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(
                  majorGridLines: const MajorGridLines(width: 0),
                  labelStyle: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                primaryYAxis: NumericAxis(
                  majorGridLines: const MajorGridLines(width: 0),
                  labelStyle: TextStyle(fontSize: 12, color: Colors.grey),
                ),

                series: [
                  BarSeries<ChartData, String>(
                    dataSource: data,
                    xValueMapper: (ChartData data, _) => data.month,
                    yValueMapper: (ChartData data, _) => data.value,
                    color: Colors.black.withValues(alpha: 0.1),
                    width: 0.6,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
