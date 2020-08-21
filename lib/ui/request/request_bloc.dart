import 'package:carcovid/data/data.dart';
import 'package:flutter/material.dart';

class RequestBloc {
  final _data = Data();
  selectLightInformation({int selectColor}) {
    switch (selectColor) {
      case 1:
        return Colors.green;
        break;
      case 2:
        return Colors.yellow;
        break;
      case 3:
        return Colors.red;
        break;
      default:
    }
  }

  selectOutWorkInformation({int selectColor}) {
    switch (selectColor) {
      case 1:
        return 'Horario de Toque de Queda: 23:00 a 05:00\n\n ${_data.green}';
        break;
      case 2:
        return _data.yellow;
        break;
      case 3:
        return _data.red;
        break;
      default:
    }
  }

  selectDayWithLicensePlate(bool select, String day) {
    if (select) {
      if ('martes' == day || 'jueves' == day || 'sábado' == day) {
        return true;
      } else {
        return false;
      }
    } else {
      if ('lunes' == day || 'miércoles' == day || 'viernes' == day) {
        return true;
      } else {
        return false;
      }
    }
  }
}
