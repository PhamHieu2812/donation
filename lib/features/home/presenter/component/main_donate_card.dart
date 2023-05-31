import 'package:donation/core/image_constants.dart';
import 'package:flutter/material.dart';

class MainDonateCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.pushNamed(context, '/detail');
      },
      child: Card(
        elevation: 20,
        shadowColor: Colors.black.withOpacity(0.6),
        child: Container(
          height: MediaQuery.of(context).size.height / 2.7,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
                width: double.maxFinite,
                child: Image.asset(
                  ImageConstants.fruit,
                  fit: BoxFit.fitWidth,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Fresh fruits for improving child...",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: LinearProgressIndicator(
                      minHeight: 6,
                      value: 0.9,
                      color: Colors.green,
                      backgroundColor: Colors.grey.shade200,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      "81%",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 16, color: Colors.black.withOpacity(0.5)),
                    ),
                  ),
                ],
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Pay Raised",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 15),
                        ),
                        Text(
                          "\$54",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        ),
                      ],
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "8 hours",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
