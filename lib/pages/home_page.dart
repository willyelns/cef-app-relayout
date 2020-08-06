import 'package:caixa_relayout/ui/components/home_body.dart';
import 'package:caixa_relayout/ui/components/home_header.dart';
import 'package:caixa_relayout/ui/utils.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  @override
  build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HomeHeader(),
          HomeBody(),
        ],
      ),
    ));
  }
}

