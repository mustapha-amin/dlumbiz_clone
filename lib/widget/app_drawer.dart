import 'package:dlumbiz_clone/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

final currentIndexProvider = StateProvider((ref) {
  return 0;
});

class CustomTile extends ConsumerWidget {
  final String title;
  final IconData iconData;
  final int index;
  CustomTile({
    required this.title,
    required this.iconData,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: ListTile(
        minVerticalPadding: 0,
        minTileHeight: 35,
        contentPadding: EdgeInsets.symmetric(horizontal: 8),
        horizontalTitleGap: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        tileColor:
            index == ref.watch(currentIndexProvider)
                ? Color(0xff418DFB)
                : Colors.transparent,
        leading: Icon(
          iconData,
          size: 14,
          color:
              index == ref.watch(currentIndexProvider)
                  ? Colors.white
                  : Colors.black,
        ),
        onTap: () {
          ref.read(currentIndexProvider.notifier).state = index;
        },
        title: Text(
          title,
          style: kTextStyle(
            10,
            color:
                index == ref.watch(currentIndexProvider)
                    ? Colors.white
                    : Colors.black,
            isBold: true,
          ),
        ),
        trailing: switch (title) {
          "Sales" || "Purchases" || "Time Tracking" || "Accountant" => Icon(
            Iconsax.arrow_right_2,
            size: 14,
            color:
                index == ref.watch(currentIndexProvider)
                    ? Colors.white
                    : Colors.black,
          ),
          _ => null,
        },
      ),
    );
  }
}

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 150,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 3.0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            CustomTile(title: 'Home', iconData: Iconsax.home_copy, index: 0),
            CustomTile(title: 'Banking', iconData: Iconsax.bank_copy, index: 1),
            CustomTile(title: 'Items', iconData: Iconsax.box, index: 2),
            const SizedBox(height: 5),
            CustomTile(
              title: 'Sales',
              iconData: Iconsax.shopping_cart_copy,
              index: 3,
            ),
            CustomTile(
              title: 'Purchases',
              iconData: Iconsax.shopping_bag_copy,
              index: 4,
            ),
            CustomTile(
              title: 'Time Tracking',
              iconData: Iconsax.clock_copy,
              index: 5,
            ),
            CustomTile(
              title: 'Accountant',
              iconData: Iconsax.profile_2user_copy,
              index: 6,
            ),
            const SizedBox(height: 5),
            CustomTile(
              title: 'Reports',
              iconData: Iconsax.document_copy,
              index: 7,
            ),
            CustomTile(
              title: 'Documents',
              iconData: Iconsax.folder_copy,
              index: 8,
            ),
            CustomTile(
              title: 'Payroll',
              iconData: Iconsax.money_copy,
              index: 9,
            ),
          ],
        ),
      ),
    );
  }
}
