import 'package:carcovid/theme/constants.dart';
import 'package:carcovid/ui/home/home_bloc.dart';
import 'package:carcovid/ui/home/widgets/lights_widget.dart';
import 'package:carcovid/ui/request/request.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/ScaleRoute.dart';
import 'widgets/date_widget.dart';
import 'widgets/license_plate_widget.dart';

class Home extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final blocHome = Provider.of<HomeBloc>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.accentColor,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: theme.accentColor,
          title: Text(
            'Circulación Vehícular',
            style: theme.accentTextTheme.headline2
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    LicensePlate(),
                    SizedBox(
                      height: 20,
                    ),
                    FechaWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    LightsWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomSheet: _OnSubmit(
          onTap: () {
            if (_formKey.currentState.validate()) {
              FocusScope.of(context).requestFocus(new FocusNode());

              Navigator.push(
                  context,
                  ScaleRoute(
                      page: ScreenRequest(
                    selectColor: blocHome.getSelectedLight,
                    selectLicensePlate: blocHome.getLincensePlate,
                    day: blocHome.getDateDay,
                  )));
            }
          },
        ),
      ),
    );
  }
}

class _OnSubmit extends StatelessWidget {
  const _OnSubmit({
    Key key,
    this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      width: double.infinity,
      height: 45,
      color: theme.accentColor,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: onTap,
        child: Text(
          'Verificar',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
