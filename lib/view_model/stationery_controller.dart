import 'package:flutter/cupertino.dart';

class StationeryController extends ChangeNotifier {
  final types = <Map<String, String>>[
    const {"id": "drop", "label": "DropDown"},
    const {"id": "high", "label": "High"},
    const {"id": "medium", "label": "Medium"},
    const {"id": "low", "label": "Low"},
  ];
  String selectedPen="drop";
  setpenValue(String value) {
     selectedPen=value;
     notifyListeners();
  }
  String selectedPencil="drop";
  setpencilValue(String value) {
     selectedPencil=value;
     notifyListeners();
  }
  String selectedbook="drop";
  setbookValue(String value) {
     selectedbook=value;
     notifyListeners();
  }

}
