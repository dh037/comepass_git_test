
import 'package:comepass/screen/main/main_screen.dart';
import 'package:flutter/material.dart';

class MainHomeNotifier extends ChangeNotifier {

  int ticketBannerDotIndicatorIndex = 0;
  int eventBannerIndex = 0;

  PageController pageController = PageController(viewportFraction: 0.9);

  List<Ticket> ticketList = [];

  ticketBanner(value) {
    ticketBannerDotIndicatorIndex = value;
    notifyListeners();
  }

  eventBanner(value) {
    eventBannerIndex = value;
    notifyListeners();
  }
}


class Ticket {
  String? shopName;

  Ticket({this.shopName});

  Ticket.fromJson(Map<String, dynamic> json) {
    shopName = json['shop_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shop_name'] = this.shopName;
    return data;
  }
}
