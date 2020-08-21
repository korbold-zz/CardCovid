import 'package:carcovid/data/data.dart';
import 'package:carcovid/ui/home/common/debouncer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeBloc with ChangeNotifier {
  final debouncer = Debouncer();
  final lettersData = Data();
  Color _colorLicense = Colors.white;
  int _selectLight = 2;
  bool _selectNumber;
  String _day;

  // Lights' States
  set setSeletedLight(int selected) {
    _selectLight = selected;
    notifyListeners();
  }

  get getSelectedLight => _selectLight;

  /* Verify License Plate Process */

  void onChangeText(String letters) {
    debouncer.run(() {
      if (letters.isNotEmpty) verifyLicensePlate(letters);
    });
  }

  verifyLicensePlate(String letters) {
    String letterfound1;
    String letterfound2;

    if (letters.length > 2) {
      String letterV2 = letters.substring(1, 2);
      String letterV1 = letters.substring(0, 1);

      for (var item in lettersData.letter1) {
        if (item == letterV1) {
          letterfound1 = item;
        }
      }
      for (var item in lettersData.letter2) {
        if (item == letterV2) {
          letterfound2 = item;
        }
      }
      if (letterfound2 == 'A' || letterfound2 == 'U' || letterfound2 == 'Z') {
        if (letterfound1.isNotEmpty) {
          _colorLicense = Colors.orange;
          notifyListeners();
        }
      } else if (letterfound2 == 'E' || letterfound2 == 'X') {
        if (letterfound1.isNotEmpty) {
          _colorLicense = Colors.yellowAccent[400];
          notifyListeners();
        }
      } else if (letterfound2 == 'M') {
        if (letterfound1.isNotEmpty) {
          _colorLicense = Colors.greenAccent[400];
          notifyListeners();
        }
      } else if (letterfound2 == null) {
        _colorLicense = Colors.white;
        notifyListeners();
      }
    } else {
      _colorLicense = Colors.white;
      notifyListeners();
    }
  }

  get colorLicensePlate => _colorLicense;

  /* Get Lincense Plate the number end */

  void onChangeEndNumber(String letters) {
    debouncer.run(() {
      if (letters.isNotEmpty) _setLicensePlate(letters);
    });
  }

  _setLicensePlate(String select) {
    if (select.length >= 3) {
      String letter = select.substring(select.length - 1);
      int endNumber = int.parse(letter);
      if (endNumber % 2 == 0) {
        _selectNumber = true;
        notifyListeners();
      } else {
        _selectNumber = false;
        notifyListeners();
      }
    }
  }

  get getLincensePlate => _selectNumber;

  /* get select day */
  setDate({DateTime date}) {
    _day = DateFormat('EEEE', 'es').format(date);
  }

  get getDateDay => _day;
}
