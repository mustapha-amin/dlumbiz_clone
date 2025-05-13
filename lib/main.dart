import 'package:dlumbiz_clone/content.dart';
import 'package:dlumbiz_clone/widget/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

TextStyle kTextStyle(double size, {Color? color, bool? isBold}) {
  return TextStyle(
    fontSize: size,
    color: color ?? Colors.black,
    fontWeight: isBold! ? FontWeight.w900 : FontWeight.w200,
  );
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const Dashboard(),
      ),
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        leading:
            MediaQuery.of(context).size.width < 600
                ? Builder(
                  builder:
                      (context) => InkWell(
                        onTap: () => Scaffold.of(context).openDrawer(),
                        child: Icon(Iconsax.menu_1_copy, color: Colors.white),
                      ),
                )
                : null,

        title: Text.rich(
          TextSpan(
            text: "D",
            style: kTextStyle(15, isBold: true, color: Colors.white),
            children: [
              TextSpan(
                text: "lume",
                style: kTextStyle(15, isBold: false, color: Colors.white),
              ),
              TextSpan(
                text: "B",
                style: kTextStyle(15, isBold: true, color: Colors.blue),
              ),
              TextSpan(
                text: "iz",
                style: kTextStyle(15, isBold: false, color: Colors.white),
              ),
            ],
          ),
        ),
        actions: [
          Row(
            spacing: 15,
            children: [
              Text(
                "Trial expires in 14 days",
                style: kTextStyle(10, isBold: false, color: Colors.white),
              ),
              Icon(Iconsax.verify, color: Colors.blue),
              Icon(Iconsax.add_square, color: Colors.blue),
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    "G",
                    style: kTextStyle(12, color: Colors.white, isBold: true),
                  ),
                ),
              ),
            ],
          ),
        ],
        backgroundColor: Color(0xff21263C),
      ),
      drawer: MediaQuery.of(context).size.width < 700 ? AppDrawer() : null,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 700;
          return Row(
            children: [if (!isMobile) AppDrawer(), Expanded(child: Content())],
          );
        },
      ),
    );
  }
}
