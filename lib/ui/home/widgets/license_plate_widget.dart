import 'package:carcovid/theme/constants.dart';
import 'package:carcovid/ui/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LicensePlate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBloc>(context);
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 2.3)),
      child: Column(
        children: <Widget>[
          Container(
            height: 30,
            color: bloc.colorLicensePlate,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    'assets/img/ant.png',
                    alignment: Alignment.center,
                    width: 25,
                    height: 25,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'E C U A D O R',
                    style: theme.accentTextTheme.headline2.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 90,
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 120,
                    child: TextFormField(
                      onChanged: bloc.onChangeText,
                      validator: (value) {
                        if (value.isEmpty) return 'Ingrese el dato';
                        if (value.length < 3)
                          return 'Campo Incompleto';
                        else
                          return null;
                      },
                      textAlign: TextAlign.center,
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter(RegExp("[A-Z]")),
                        LengthLimitingTextInputFormatter(3),
                      ],
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.characters,
                      style: TextStyle(fontSize: 40),
                      decoration: InputDecoration(hintText: 'ABC'),
                    ),
                  ),
                  Text(
                    '-',
                    style: TextStyle(fontSize: 40),
                  ),
                  Container(
                    width: 120,
                    child: TextFormField(
                      onChanged: bloc.onChangeEndNumber,
                      validator: (value) {
                        if (value.isEmpty) return 'Ingrese el dato';
                        if (value.length < 3)
                          return 'Campo Incompleto';
                        else
                          return null;
                      },
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(4),
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      style: TextStyle(fontSize: 40),
                      decoration: InputDecoration(hintText: '0123'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
