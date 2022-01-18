import 'dart:convert';

class SchoolDebtDashboard  {
  String amountToPay;
  String amountPaid;
  String nextPaymentPay;
  String total;

  SchoolDebtDashboard({
    required this.amountToPay,
    required this.amountPaid,
    required this.nextPaymentPay,
    required this.total
  });
}

schoolDebtDashboard(dynamic payload) {
 return SchoolDebtDashboard(
   amountToPay: payload['amount_to_pay'],
   amountPaid: payload['amount_paid'],
   nextPaymentPay: payload['next_payment_day'],
   total: payload['total']
  );
}