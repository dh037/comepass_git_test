import 'package:comepass/constants/color_code.dart';
import 'package:comepass/constants/icon_path.dart';
import 'package:comepass/constants/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MainShopListScreen extends StatefulWidget {
  const MainShopListScreen({Key? key}) : super(key: key);

  @override
  State<MainShopListScreen> createState() => _MainShopListScreenState();
}

class _MainShopListScreenState extends State<MainShopListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 24.w,
                height: 24.w,
                child: SvgPicture.asset(IconPath.iconArrowForward,
                    fit: BoxFit.fill)),
            SizedBox(width: 4.w),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                    left: 8.w, right: 8.w, top: 6.h, bottom: 6.h),
                decoration: BoxDecoration(
                    color: ColorCode.grey30,
                    borderRadius: BorderRadius.circular(4)),
                height: 32.h,
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorCode.grey30,
                      borderRadius: BorderRadius.circular(4)),
                  child: Row(
                    children: [
                      Container(
                          width: 20.w,
                          height: 20.w,
                          child: SvgPicture.asset(IconPath.iconSearch,
                              fit: BoxFit.fill, color: ColorCode.grey60)),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              isCollapsed: true,
                              isDense: true,
                              hintText: "주소, 매장이름 등으로 검색해보세요"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: SizedBox(
                  width: 24.w,
                  height: 24.w,
                  child: SvgPicture.asset(IconPath.iconFilter)),
            )
          ],
        ),
      ),
      body: content(context),
    );
  }

  content(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, top: 36.h),
      child: ListView.separated(
          itemBuilder: (_, index) => Row(
                children: [
                  Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      width: 62.w,
                      height: 62.w,
                      child: Image.asset(
                        ImagePath.shopImage,
                        fit: BoxFit.fill,
                      )),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("컴패스 해운대동부센트레빌점",
                            style: TextStyle(fontSize: 14.sp, height: 1.4.sp)),
                        SizedBox(height: 2.h),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.black,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 3.h,
                                    bottom: 4.h,
                                    left: 5.w,
                                    right: 5.w),
                                child: Text(
                                  '2km',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10.sp),
                                ),
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: ColorCode.grey30,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 3.h,
                                    bottom: 4.h,
                                    left: 5.w,
                                    right: 5.w),
                                child: Text(
                                  '독서실',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10.sp),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Text("전체좌석 46석",
                            style: TextStyle(
                                color: ColorCode.grey60, fontSize: 12.sp)),
                      ],
                    ),
                  )
                ],
              ),
          separatorBuilder: (_, index) => SizedBox(height: 14.h),
          itemCount: 4),
    );
  }
}
