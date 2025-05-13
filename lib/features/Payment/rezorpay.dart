
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart' show PaymentSuccessResponse, Razorpay;

class RezorPayPayment extends StatefulWidget {
  const RezorPayPayment({super.key});

  @override
  State<RezorPayPayment> createState() => _RezorpayPaymentState();
}

class _RezorpayPaymentState extends State<RezorPayPayment> {
  final RazorpayService _paymentService = RazorpayService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _paymentService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _paymentService.checkOut(
              200,
              "877879797979",
              "k",
            );
          },
          child: Text("data"),
        ),
      ),
    );
  }
}

class RazorpayService {
  late Razorpay _razorpay;

  RazorpayService(){
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, onSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, onError);
  }

  void dispose() => _razorpay.clear();

  void onSuccess(PaymentSuccessResponse response){
    debugPrint("Payment Success: ${response.paymentId}");
  }

  void onError(PaymentSuccessResponse response){
    debugPrint("Payment Error: ${response.orderId} - ${response.signature}");
  }

  void checkOut(dynamic amount, contact, email){
    var opt = {
      'key': 'rzp_test_XXXXXX',
      'amount': amount,
      'name': 'Dealsify Books',
      'description': 'Payment for order',
      'prefill': {
        'contact': contact,
        'email': email,
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(opt);
    } catch (e) {
      debugPrint('Error: $e');
    }

  }



}
