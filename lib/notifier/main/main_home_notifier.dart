import 'package:comepass/data/model/ticket.dart';
import 'package:flutter/material.dart';

class MainHomeNotifier extends ChangeNotifier {

  late Future value;

  int ticketBannerDotIndicatorIndex = 0;
  int eventBannerIndex = 0;

  PageController pageController = PageController(viewportFraction: 0.9);

  List<Ticket> ticketList = [];

  ticketBanner(value) {
    print(value);
    ticketBannerDotIndicatorIndex = value;
    notifyListeners();
  }

  eventBanner(value) {
    eventBannerIndex = value;
    notifyListeners();
  }

  getData () async {

    await Future.delayed(const Duration(seconds: 2));

    Map<String, dynamic> ticketJsonData1 = {"shop_name": "캠퍼스 수영민락점"};
    Map<String, dynamic> ticketJsonData2 = {"shop_name": "캠퍼스 해운대점"};
    Map<String, dynamic> ticketJsonData3 = {"shop_name": "캠퍼스 기장점"};

    ticketList = [
      Ticket.fromJson(ticketJsonData1),
      Ticket.fromJson(ticketJsonData2),
      Ticket.fromJson(ticketJsonData3)
    ];



    return ticketList;
  }
}


