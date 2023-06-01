import 'package:donation/features/payment/presenter/rapyd.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class CheckOutScreen extends StatelessWidget {
  Rapyd rapyd;
  CheckOutScreen({super.key, required this.rapyd});
  late Future<Map> createdCheckoutPage;
  @override
  Widget build(BuildContext context) {
    createdCheckoutPage = rapyd.createCheckoutPage();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Align(
          child: Text(
            "Payment",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            icon: const Icon(
              Icons.close,
              size: 25,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
        elevation: 0,
      ),
      body: FutureBuilder(
        future: createdCheckoutPage,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return const Center(child: Text('Some error occurred!'));
              } else {
                return WebView(
                  initialUrl: snapshot.data["redirect_url"].toString(),
                  javascriptMode: JavascriptMode.unrestricted,
                  onPageStarted: (url) {
                    //Exit webview widget once the current url matches either checkout completed or canceled urls
                    if (url.contains(snapshot.data["complete_checkout_url"])) {
                      Navigator.pop(context);
                    } else if (url
                        .contains(snapshot.data["cancel_checkout_url"])) {
                      Navigator.pop(context);
                    }
                  },
                );
              }
          }
        },
      ),
    );
  }
}
