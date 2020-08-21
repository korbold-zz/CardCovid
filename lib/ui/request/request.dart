import 'package:carcovid/ui/request/request_bloc.dart';
import 'package:carcovid/ui/request/widgets/health.dart';
import 'package:flutter/material.dart';

class ScreenRequest extends StatelessWidget {
  const ScreenRequest(
      {Key key, this.selectColor, this.day, this.selectLicensePlate})
      : super(key: key);
  final int selectColor;
  final String day;
  final bool selectLicensePlate;

  @override
  Widget build(BuildContext context) {
    final bloc = RequestBloc();
    String _lightsColors() {
      if (selectColor == 2) {
        return bloc.selectDayWithLicensePlate(selectLicensePlate, day)
            ? '${day.toUpperCase()} CIRCULA'
            : '${day.toUpperCase()} NO CIRCULA';
      } else if (selectColor == 1) {
        return 'CIRCULA CON PRECUACIÓN';
      } else {
        return 'LEE LAS INDICACIONES,\n REVISA POR MEDIOS OFICIALES';
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: bloc.selectLightInformation(selectColor: selectColor),
        body: Center(
          child: SingleChildScrollView(
            child: _Checked(
              verify: _lightsColors(),
              text: bloc.selectOutWorkInformation(selectColor: selectColor),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Text('Aceptar'),
              onPressed: () => Navigator.of(context).pop()),
        ),
      ),
    );
  }
}

class _Checked extends StatelessWidget {
  const _Checked({Key key, this.verify, this.text}) : super(key: key);
  final String verify;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: <Widget>[
          Text(
            '$verify',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 15,),
          Health(),
          SizedBox(height: 10,),
          Text(
            'Estimado ciudadano, ¡RECUERDA!: ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$text',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
