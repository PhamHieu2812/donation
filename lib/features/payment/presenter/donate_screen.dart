import 'package:donation/core/widgets/amounts_grid_card.dart';
import 'package:donation/core/widgets/back_button.dart';
import 'package:donation/core/widgets/donate_preview_title_card.dart';
import 'package:donation/features/payment/presenter/bloc/payment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DonateScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DonateScreenState();
  }
}

class _DonateScreenState extends State {
  int selected = 1;
  int selectedAmount = 0;
  TextEditingController controller = TextEditingController();
  TextEditingController toIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: CustomBackButton(),
        title: const Align(
          child: Text("Select Amount",
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        backgroundColor: Colors.white,
        actions: const [
          SizedBox(
            width: 55,
          ),
        ],
        elevation: 0,
      ),
      body: Container(
        // height: 200,
        margin: const EdgeInsets.only(left: 26.0, right: 26.0, top: 15),
        color: Colors.transparent,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              PreviewTitleCard(),
              Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 20),
                  alignment: Alignment.centerLeft,
                  child: const Text("Select Amount",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                          fontWeight: FontWeight.bold))),
              AmountsGridCard(selected: selected, select: selectAmount),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Flexible(
                    child: Divider(
                      color: Colors.black45,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child:
                        Align(alignment: Alignment.center, child: Text("or")),
                  ),
                  Flexible(
                    child: Divider(
                      color: Colors.black45,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'BANKING FROM : 123(hieuthientai00)',
                    hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5), fontSize: 14),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide.none),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                  ),
                  enabled: false,
                  cursorColor: Colors.grey,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center,
                  controller: toIdController,
                  onChanged: (String value) {
                    value.isNotEmpty ? selectAmount(0, 0) : selectAmount(1, 50);
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Price Manually',
                    hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5), fontSize: 14),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide.none),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                  ),
                  cursorColor: Colors.grey,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center,
                  controller: controller,
                  onChanged: (String value) {
                    value.isNotEmpty ? selectAmount(0, 0) : selectAmount(1, 50);
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'BANKING TO : 124(hieuthientai2001)',
                    hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5), fontSize: 14),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide.none),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                  ),
                  enabled: false,
                  cursorColor: Colors.grey,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center,
                  controller: toIdController,
                  onChanged: (String value) {
                    value.isNotEmpty ? selectAmount(0, 0) : selectAmount(1, 50);
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: MaterialButton(
                  onPressed: () async {
                    if (selected == 0) {
                      selectedAmount = int.parse(controller.text);
                    }
                    if (await context
                        .read<PaymentBloc>()
                        .payment(selectedAmount)) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: Center(
                              child: Text("Transfer success"),
                            ),
                          );
                        },
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: Center(
                              child: Text("Transfer failed"),
                            ),
                          );
                        },
                      );
                    }
                  },
                  elevation: 2,
                  minWidth: double.maxFinite,
                  color: Colors.green,
                  child: const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      "Pay & Confirm",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
              // DonationItemCard(),
            ],
          ),
        ),
      ),
    );
  }

  //setting value of item and amount selected
  void selectAmount(int cardNo, int amount) {
    setState(() {
      selected = cardNo;
      selectedAmount = amount;
      cardNo > 0 ? controller.text = "" : 0;
    });
  }
}
