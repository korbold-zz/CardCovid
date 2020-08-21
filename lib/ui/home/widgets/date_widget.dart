import 'package:carcovid/theme/constants.dart';
import 'package:carcovid/ui/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FechaWidget extends StatefulWidget {
  @override
  _FechaWidgetState createState() => _FechaWidgetState();
}

class _FechaWidgetState extends State<FechaWidget> {
  String _editDate;
  String _editTime;

  @override
  void initState() {
    _editDate = DateFormat.yMMMMEEEEd('es').format(DateTime.now());
    _editTime = DateFormat('Hm').format(DateTime.now());
    Provider.of<HomeBloc>(context, listen: false).setDate(date: DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    selectDate() async {
      DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2021),
        locale: Locale('es'),
      );
      setState(() {
        if (picked != null) {
          _editDate = DateFormat.yMMMMEEEEd('es').format(picked);
          Provider.of<HomeBloc>(context, listen: false).setDate(date: picked);
        }
      });
    }

    selectTime() async {
      final TimeOfDay picked =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());
      setState(() {
        if (picked != null) {
          _editTime = picked.format(context).toString();
        } else {
          DateFormat('Hm').format(DateTime.now());
        }
      });
    }

    return Column(
      children: <Widget>[
        _Button(
          editDate: _editDate,
          iconData: Icons.calendar_today,
          selectFuntion: selectDate,
        ),
        SizedBox(
          height: 20,
        ),
        _Button(
          editDate: 'Hora de Establecida: $_editTime',
          iconData: Icons.alarm,
          selectFuntion: selectTime,
        )
      ],
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key key,
    @required String editDate,
    this.selectFuntion,
    this.iconData,
  })  : _editDate = editDate,
        super(key: key);

  final String _editDate;
  final Function selectFuntion;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 50,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(iconData),
              Text(
                _editDate,
                style: theme.accentTextTheme.headline2
                    .copyWith(color: Colors.black, fontSize: 17),
              ),
              Spacer(),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        selectFuntion();
      },
    );
  }
}
