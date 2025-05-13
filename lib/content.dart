import 'package:dlumbiz_clone/main.dart';
import 'package:dlumbiz_clone/widget/dashboard_stat.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class Content extends StatefulWidget {
  const Content({super.key});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    FocusManager.instance.primaryFocus?.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        controller: _scrollController,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello, D'Lume", style: kTextStyle(15, isBold: true)),
                  Text(
                    "info@dlume.com",
                    style: kTextStyle(10, isBold: false, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [Icon(Iconsax.profile_add), Text("Add customer")],
                  ),
                ),
              ],
            ),
          ),
          Row(
            spacing: 4,
            children: [
              Expanded(
                child: DashboardStat(
                  title: 'Purchase Invoice',
                  subtitle: 'Total Unpaid Invoices: \$0.00',
                  left: _invoiceStatus("DAILY SALES", 90, Colors.green),
                  right: _invoiceStatus("OVERDUE", 90, Colors.red),
                ),
              ),
              Expanded(
                child: DashboardStat(
                  title: "Sales Invoice",
                  subtitle: "Total Stock",
                  left: _invoiceStatus("STOCK OVERVIEW", null, Colors.green),
                  right: _invoiceStatus("OUT OF STOCK", null, Colors.red),
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          ProductStat(),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "View sales history",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "View Purchase history",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _invoiceStatus(String title, int? amount, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),

        Text(
          amount == null ? '' : '\$ $amount L',
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
      ],
    );
  }
}
