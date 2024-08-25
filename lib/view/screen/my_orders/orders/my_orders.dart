import 'package:classic_ecommerce/utils/app_colors.dart';
import 'package:classic_ecommerce/view/screen/my_orders/orders/widget/tab_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'delivered_orders.dart';
import 'ongoing_orders.dart';
import 'returned_orders.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _SampleState();
}

class _SampleState extends State<MyOrders> with SingleTickerProviderStateMixin {
  final tabs = <Widget>[
    TabCard(iconData: Icons.directions_bike, text: "ongoing".tr),
    TabCard(iconData: Icons.assignment_turned_in_outlined, text: "delivered".tr),
    TabCard(iconData: Icons.assignment_return_outlined, text: "returned".tr),
  ];

  late final controller = TabController(length: tabs.length, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text("my_orders".tr),
        bottom: TabBar(
          // indicatorColor: AppColors.redColor,
          padding: EdgeInsets.zero,
          controller: controller,
          labelColor: Colors.white,
          labelStyle: const TextStyle(fontWeight: FontWeight.w600),
          unselectedLabelStyle: TextStyle(color: Colors.white.withOpacity(.9)),
          tabs: tabs,
          overlayColor: const WidgetStatePropertyAll(AppColors.bg1LightColor),
          indicatorPadding: EdgeInsets.zero,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: const Color(0xffFF6F00),
            border: Border.all(strokeAlign: BorderSide.strokeAlignInside, color: Colors.transparent),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
          child: TabBarView(controller: controller, children: const [OnGoingOrders(), DeliveredOrders(), ReturnedOrders()]),
        ),
      ),
    );
  }
}
