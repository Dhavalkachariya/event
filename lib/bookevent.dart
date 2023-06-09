import 'package:flutter/material.dart';
import 'package:event/images.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pay/pay.dart';


class book extends StatefulWidget {
  const book({super.key});

  @override
  State<book> createState() => _bookState();
}

class _bookState extends State<book> {
  final _paymentItems = [
    PaymentItem(
      label: 'Total',
      amount: '99.99',
      status: PaymentItemStatus.final_price,
    )
  ];
  void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }
  // final paymentItem=<PaymentItem>[];
  // void initState(){
  //   paymentItem.add(PaymentItem(amount: '200',status: PaymentItemStatus.final_price));
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    final Uri whatsApp = Uri.parse("whatsapp://send?phone=9662013968");
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Book Event"),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: SingleChildScrollView(
          child: Container(
              child: Form(
                  child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 130, right: 20),
              child: Container(
                height: 400,
                decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage(paymentQR))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 120),
              child: Center(
                child: Container(
                  height: 20.0,
                  child: Row(
                    children: [
                      const SizedBox(height: 30),
                      Icon(Icons.whatsapp),
                      GestureDetector(
                          onTap: (() async {
                            launchUrl(whatsApp);
                          }),
                          child: (Text("9662013968"))),
                    ],
                  ),
                ),

              ),
            ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: GooglePayButton(
                        paymentConfigurationAsset: 'gpay.json',
                        paymentItems: _paymentItems,
                        type: GooglePayButtonType.pay,
                        margin: const EdgeInsets.only(top: 15.0),
                        onPaymentResult: onGooglePayResult,
                        loadingIndicator: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),




                    // Padding(
                    //     padding: EdgeInsets.all(25.0),
                    //   child: Center(
                    //     child: Container(
                    //       child: GooglePayButton(paymentConfigurationAsset: 'gpay.json',
                    //       paymentItems: paymentItem,
                    //       onPaymentResult: (data){
                    //         print(data);
                    //       },
                    //
                    //         width: 200,
                    //         height: 60,
                    //         type: GooglePayButtonType.pay,
                    //       ),
                    //     ),
                    //   ),
                    // )
          ]
                  )
              )
          
          ),
        )
    );
  }
}
