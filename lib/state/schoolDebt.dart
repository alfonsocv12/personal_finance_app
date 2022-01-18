import 'package:personal_finance_app/models/schoolDebtDashboard.dart';

class SchoolDebtState {
  SchoolDebtDashboard? _schoolDebt;

  SchoolDebtDashboard? get schoolDebt {
    return _schoolDebt;
  }

  set schoolDebt(SchoolDebtDashboard? payload) {
    _schoolDebt = payload;
  }
}

SchoolDebtState schoolDebtState = SchoolDebtState();