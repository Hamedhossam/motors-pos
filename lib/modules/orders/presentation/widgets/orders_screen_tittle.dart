import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motors/core/screens/home_screen.dart';
import 'package:motors/core/widgets/label.dart';

class OrdersScreenTittle extends StatelessWidget {
  const OrdersScreenTittle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 3.0),
          child: SizedBox(
              height: 40.h,
              width: 40.w,
              child: Image.asset("assets/icons/orders.png")),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Label(tittle: "Orders"),
        ),
      ],
    );
  }
}
