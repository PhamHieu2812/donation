import 'package:donation/core/app_color.dart';
import 'package:donation/core/widgets/category_menu.dart';
import 'package:donation/core/widgets/donation_item_card.dart';
import 'package:donation/features/home/presenter/component/main_donate_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "Dashboard",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: AppColor.backgroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: IconButton(
              icon: const Icon(
                Icons.notifications,
                size: 25,
                color: Colors.blueGrey,
              ),
              onPressed: () {},
            ),
          )
        ],
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SearchBar(
                hintText: "Search",
              ),
              MainDonateCard(),
              Container(
                margin: const EdgeInsets.only(top: 15),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Categories",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CategoryMenu(),
              DonationItemCard(),
            ],
          ),
        ),
      ),
    );
  }
}
