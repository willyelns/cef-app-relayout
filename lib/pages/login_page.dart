import 'package:caixa_relayout/pages/home_page.dart';
import 'package:caixa_relayout/ui/utils.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          LoginHeader(),
          LoginBody(),
        ]),
      ),
    );
  }
}

class LoginBody extends StatelessWidget {
  const LoginBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      constraints: BoxConstraints(
          minHeight: size.height * 0.6, maxHeight: size.height * 0.75),
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
                    onChanged: (value) {},
                    value: true),
              ],
            ),
          ),
          const SizedBox(height: kPadding),
          Image.network(
            'https://placehold.it/75x75',
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

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.25,
            decoration: BoxDecoration(color: kPrimaryColor),
            padding: const EdgeInsets.symmetric(
                horizontal: kPadding * 2, vertical: kPadding),
            child: Column(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(text: 'INTERNET'),
                        TextSpan(
                          text: ' BANKING',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ]),
                ),
                Spacer(),
                Image.network(
                  'https://placehold.it/200x50',
                  width: 185,
                  height: 43,
                ),
                Spacer(),
                Row(children: <Widget>[
                  // ! Add animation in text button
                  RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kPadding * 1.5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(kPadding),
                        child: Text(
                          'Pessoa Física'.toUpperCase(),
                          style: TextStyle(color: kPrimaryColor),
                        ),
                      ),
                      onPressed: () {}),
                  Spacer(),
                  RaisedButton(
                      // color: Colors.white, //! color animated
                      color: Color(0xFFF9F9F9), //! color animated
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kPadding * 1.5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(kPadding),
                        child: Text(
                          'Pessoa Jurídica'.toUpperCase(),
                          style: TextStyle(
                            color: Color(0xFF919191),
                            //TextStyle(color: kPrimaryColor), //! color animated
                          ),
                        ),
                      ),
                      onPressed: () {}),
                ]),
              ],
            ),
          ),
          Positioned(
            right: kPadding,
            top: 0,
            child: IconButton(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                icon: Icon(Icons.more_vert, color: Colors.white),
                onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
