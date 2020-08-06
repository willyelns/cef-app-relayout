import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../pages/home_page.dart';
import '../utils.dart';

class LoginBody extends HookWidget {
  const LoginBody({
    Key key,
    this.isPersonalAccount = true,
  }) : super(key: key);

  final bool isPersonalAccount;

  @override
  Widget build(BuildContext context) {
    final saveUser = useState<bool>(true);
    final Size size = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        AnimatedOpacity(
          duration: Duration(milliseconds: 200),
          opacity: isPersonalAccount ? 1.0 : 0.0,
          child: buildAccountTypeForm(size, context, saveUser, isPersonalAccount)),
        AnimatedOpacity(
          duration: Duration(milliseconds: 200),
          opacity: !isPersonalAccount ? 1.0 : 0.0,
          child: buildAccountTypeForm(size, context, saveUser, !isPersonalAccount)),
      ],
    );
  }

  AnimatedContainer buildAccountTypeForm(Size size, BuildContext context, ValueNotifier<bool> saveUser, bool showContainer) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 400),
        width: size.width,
        transform: showContainer ? Matrix4.translationValues(0.0, 0.0, 0.0) : Matrix4.translationValues(0.0, (size.height * 0.75), 0.0),
        height: size.height * 0.75,
        padding: const EdgeInsets.all(kPadding * 2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(kPadding * 2),
            topRight: Radius.circular(kPadding * 2),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: kPadding / 2),
            TextField(
              decoration: InputDecoration(
                labelText: 'Usuário',
                labelStyle: TextStyle(color: kInputColor),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: kInputColor),
                ),
                border: const OutlineInputBorder(
                  borderSide: const BorderSide(color: kInputColor),
                ),
              ),
            ),
            const SizedBox(height: kPadding * 2),
            TextField(
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(color: kInputColor),
                suffixIcon: IconButton(
                  icon: Icon(Icons.help_outline, color: kSecondaryColor),
                  onPressed: () {},
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: kInputColor),
                ),
                border: const OutlineInputBorder(
                  borderSide: const BorderSide(color: kInputColor),
                ),
              ),
            ),
            const SizedBox(height: kPadding * 2),
            RaisedButton(
                color: kPrimaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(kPadding),
                  child: Text(
                    'Acessar minha conta'.toUpperCase(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Lembrar meu usuário',
                    style: TextStyle(color: kTextColor),
                  ),
                  Switch(
                      activeColor: kSecondaryColor,
                      onChanged: (value) {
                        saveUser.value = value;
                      },
                      value: saveUser.value),
                ],
              ),
            ),
            const SizedBox(height: kPadding),
            Image.asset(
              'lib/assets/images/biometric.png',
              width: 75,
              height: 75,
            ),
            const SizedBox(height: kPadding),
            FlatButton(
                child: Text(
                  'Não tenho usuário'.toUpperCase(),
                  style: TextStyle(color: kPrimaryColor),
                ),
                onPressed: () {}),
            FlatButton(
                child: Text(
                  'Modo acessibiliadde'.toUpperCase(),
                  style: TextStyle(color: kPrimaryColor),
                ),
                onPressed: () {}),
          ],
        ),
      );
  }
}

