import 'package:carcovid/ui/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LightsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBloc>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _CircularLight(
          color: Colors.green,
          selected: 1 == bloc.getSelectedLight,
          onTap: () => bloc.setSeletedLight = 1,
        ),
        _CircularLight(
          color: Colors.yellow,
          selected: 2 == bloc.getSelectedLight,
          onTap: () => bloc.setSeletedLight = 2,
        ),
        _CircularLight(
          color: Colors.red,
          selected: 3 == bloc.getSelectedLight,
          onTap: () => bloc.setSeletedLight = 3,
        ),
      ],
    );
  }
}

class _CircularLight extends StatelessWidget {
  const _CircularLight({Key key, this.color, this.selected = false, this.onTap})
      : super(key: key);
  final Color color;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: selected ? 4 : 0,
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        height: 80,
        width: 80,
      ),
      onTap: onTap,
    );
  }
}
