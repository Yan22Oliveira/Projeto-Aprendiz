import 'package:flutter/material.dart';

import '../../../../shared/shared.dart';

class LoginPage extends StatelessWidget {

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AppImages.logoDiv,
            ),
            const TextForm(
              text: 'Informe seu e-mail',
            ),
            const SizedBox(height: 8,),
            const FormGeral(
              labelText: 'E-mail',
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
            ),
            const SizedBox(height: 16,),
            const TextForm(
              text: 'Informe sua senha',
            ),
            const SizedBox(height: 8,),
            const FormGeral(
              labelText: 'Senha',
              password: true,
            ),
            const SizedBox(height: 8,),
            Container(
              alignment: Alignment.bottomRight,
              child: TextButtonPrincipal(
                onPressed: (){

                },
                text: 'Esqueceu a senha?',
              ),
            ),
            const SizedBox(height: 40,),
            ButtonPrincipal(
              onPressed: (){

              },
              text: 'Autenticar',
            ),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Não possui uma conta?',
                  style: TextStyles.textForm,
                ),
                TextButtonPrincipal(
                  onPressed: (){

                  },
                  text: 'Criar conta',
                  textStyle: TextStyles.textLabelButtonBold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
