

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/color_code.dart';
import '../notifier/main/main_home_notifier.dart';

class CustomTicketBanner extends StatelessWidget {
  Ticket ticket;
  CustomTicketBanner({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
          child: Container(
            padding: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              color: const Color(0xff000000).withOpacity(0.1),
              border: Border(
                  left: BorderSide(width: 3, color: ColorCode.green50),
                  top: BorderSide(
                      color: const Color(0xff1affffff).withOpacity(0.06),
                      width: 2),
                  right: BorderSide(
                      color: const Color(0xff1affffff).withOpacity(0.06),
                      width: 0.9)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      ticket.shopName.toString(),
                      style: TextStyle(
                          color: ColorCode.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp),
                    ),
                    SizedBox(width: 4.w),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                          color: ColorCode.green50,
                          child: Text("자유석", style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.white),)),
                    )
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Text(
                      '5일∙4시간',
                      style: TextStyle(
                          color: Colors.white, fontSize: 12.sp, height: 1.4.sp),
                    ),
                    Text('/ 2주∙1시간',
                        style: TextStyle(
                            color: Colors.grey, fontSize: 12.sp, height: 1.4.sp))
                  ],
                ),
              ],
            ),
            margin: const EdgeInsets.only(right: 8),
          ),
        ));
  }
}
