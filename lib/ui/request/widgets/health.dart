import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Health extends StatelessWidget {
  const Health({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildPreventation();
  }
}

Row buildPreventation() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      PreventitonCard(
        svgSrc: "assets/icons/hand_wash.svg",
        title: "Lavarse la Manos",
      ),
      PreventitonCard(
        svgSrc: "assets/icons/use_mask.svg",
        title: "Use la marscarilla",
      ),
      PreventitonCard(
        svgSrc: "assets/icons/Clean_Disinfect.svg",
        title: "Desinfecte",
      ),
    ],
  );
}

class PreventitonCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  const PreventitonCard({
    Key key,
    this.svgSrc,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SvgPicture.asset(svgSrc),
        Text(
          title,
        )
      ],
    );
  }
}
