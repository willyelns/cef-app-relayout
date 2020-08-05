import 'package:caixa_relayout/ui/utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
              width: size.width,
              height: size.height * 0.25,
              color: kPrimaryColor,
              padding: const EdgeInsets.all(kPadding * 2),
              child: SafeArea(
                child: Stack(
                  children: <Widget>[
                    Row(children: <Widget>[
                      Image.network('https://placehold.it/30x30'),
                      Spacer(),
                      //! Widget dropdown
                      Row(children: <Widget>[
                        Text('Conta Poupança'),
                      ]),
                      Spacer(),
                      //! Notification Button
                    ]),
                    Positioned(
                        bottom: -40,
                        left: 0,
                        right: 0,
                        child: Container(
                          width: 200,
                          height: 80,
                          margin: const EdgeInsets.symmetric(
                              horizontal: kPadding * 2),
                          decoration: BoxDecoration(color: Colors.white),
                        ))
                  ],
                ),
              )),
          Container(
            width: size.width,
            height: size.height * 0.7,
          ),
        ],
      ),
    ));
  }
}
