import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../utils.dart';

class HomeButtonViewModel {
  const HomeButtonViewModel(
      {@required this.label,
      @required this.imageName,
      @required this.onPressed});
  final String label;
  final String imageName;
  final OnPressed onPressed;
}

class HomeBody extends HookWidget {
  const HomeBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final showMoneyValue = useState<bool>(true);
    final firstLine = [
      HomeButtonViewModel(
          imageName: 'icon-1', label: 'Minha conta', onPressed: () {}),
      HomeButtonViewModel(
          imageName: 'icon-2', label: 'Pagamentos', onPressed: () {}),
      HomeButtonViewModel(
          imageName: 'icon-3', label: 'Extrato', onPressed: () {}),
    ];
    final secondLine = [
      HomeButtonViewModel(
          imageName: 'icon-4', label: 'Cartões', onPressed: () {}),
      HomeButtonViewModel(
          imageName: 'icon-5', label: 'Transferências', onPressed: () {}),
      HomeButtonViewModel(
          imageName: 'icon-6', label: 'Habitação', onPressed: () {}),
    ];
    final thirdLine = [
      HomeButtonViewModel(
          imageName: 'icon-7', label: 'Créditos', onPressed: () {}),
      HomeButtonViewModel(
          imageName: 'icon-8', label: 'Investimentos', onPressed: () {}),
      HomeButtonViewModel(
          imageName: 'icon-9', label: 'Loterias', onPressed: () {}),
    ];
    final fourthLine = [
      HomeButtonViewModel(
          imageName: 'icon-10', label: 'Seguros', onPressed: () {}),
      HomeButtonViewModel(
          imageName: 'icon-11', label: 'Portabilidade', onPressed: () {}),
      HomeButtonViewModel(
          imageName: 'icon-12', label: 'Recarga', onPressed: () {}),
    ];
    final List<List<HomeButtonViewModel>> buttonLines = [
      firstLine,
      secondLine,
      thirdLine,
      fourthLine
    ];

    final Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      width: size.width,
      height: size.height * 0.78,
      margin: const EdgeInsets.symmetric(horizontal: kPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildCard(size, showMoneyValue),
          Container(
            transform: Matrix4.translationValues(0.0, -50.0, 0.0),
            child: Column(
              children: <Widget>[
                for (final line in buttonLines) buildButtonLine(buttons: line),
              ],
            ),
          ),
          Center(
              child: FlatButton(
            child:
                Text('Solicitar ajuda', style: TextStyle(color: kPrimaryColor)),
            onPressed: () {},
          )),
        ],
      ),
    );
  }

  Container buildCard(Size size, ValueNotifier<bool> showMoney) {
    return Container(
            width: size.width,
            height: 150,
            transform: Matrix4.translationValues(0.0, -75.0, 0.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(kPadding / 2),
                ),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      color: Colors.black.withOpacity(0.25))
                ]),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(kPadding * 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Saldo em conta'),
                      Spacer(),
                      Row(
                        children: <Widget>[ 
                          Stack(
                            children: <Widget>[
                              AnimatedOpacity(
                                duration: Duration(milliseconds: 200),
                                opacity: showMoney.value ? 1.0 : 0.0,
                                                              child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 26),
                                    children: [
                                      TextSpan(
                                        text: r'R$',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal),
                                      ),
                                      TextSpan(text: ' 200,00'),
                                    ],
                                  ),
                                ),
                              ),
                              AnimatedOpacity(
                            duration: Duration(milliseconds: 200),
                            opacity: !showMoney.value ? 1.0 : 0.0,
                                                      child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26),
                                children: [
                                  TextSpan(
                                    text: r'R$',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal),
                                  ),
                                  TextSpan(text: ' ●●●●●'),
                                ],
                              ),
                            ),
                          ),
                            ],
                          ),
                          Spacer(),
                          GestureDetector(
                              onTap: () {
                                showMoney.value = !showMoney.value;
                              },
                              child: Stack(
                                children: <Widget>[
                                  AnimatedOpacity(
                                    duration: Duration(milliseconds: 200),
                                    opacity: showMoney.value ? 1.0 : 0.0,
                                                                      child: Text('Esconder',
                                        style: TextStyle(
                                          color: kPrimaryColor,
                                        ),
                                        ),
                                  ),
                                  AnimatedOpacity(
                                    duration: Duration(milliseconds: 200),
                                    opacity: showMoney.value ? 0.0 : 1.0,
                                                                      child: Text( 'Mostrar',
                                        style: TextStyle(
                                          color: kPrimaryColor,
                                        )),
                                  ),
                                ],
                              ))
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                Positioned(
                  top: kPadding / 10,
                  right: kPadding / 2,
                  child: IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                )
              ],
            ));
  }

  Row buildButtonLine({List<HomeButtonViewModel> buttons}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        for (final button in buttons) buildHomeButton(button),
      ],
    );
  }

  Column buildHomeButton(HomeButtonViewModel button) {
    return Column(
      children: <Widget>[
        InkWell(
          splashColor: kPrimaryColor,
          hoverColor: kPrimaryColor,
          focusColor: kPrimaryColor,
          highlightColor: kPrimaryColor,
            onTap: button.onPressed,
            child: Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                color: Color(0xFFF3F3F3),
                borderRadius: BorderRadius.circular(kPadding),
              ),
              child: Image.asset('lib/assets/images/${button.imageName}.png', width: 50, height: 50),
            )),
        const SizedBox(height: kPadding / 2),
        Text(
          button.label,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: kPadding),
      ],
    );
  }
}
