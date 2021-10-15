import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../shared/shared.dart';

class CreateAccountSecond extends StatelessWidget {

  const CreateAccountSecond({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var altura = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Criar Conta',
          style: TextStyles.titleAppBar,
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: altura - 40,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: const [
                    SizedBox(height: 32,),
                    TimeLine(
                      colors: AppColors.verde,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    TextForm(
                      text: 'E-mail',
                    ),
                    SizedBox(height: 8,),
                    FormGeral(
                      labelText: 'E-mail',
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                    ),
                    SizedBox(height: 16,),
                    TextForm(
                      text: 'Informe sua senha',
                    ),
                    SizedBox(height: 8,),
                    FormGeral(
                      labelText: 'Senha',
                      password: true,
                    ),
                    SizedBox(height: 16,),
                    TextForm(
                      text: 'Confirmar senha',
                    ),
                    SizedBox(height: 8,),
                    FormGeral(
                      labelText: 'Senha',
                      password: true,
                    ),
                  ],
                ),
                Column(
                  children: [
                    ButtonPrincipal(
                      onPressed: (){

                      },
                      text: 'Próximo',
                      icon: Icons.arrow_forward_outlined,
                    ),
                    const SizedBox(height: 4,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Já possui uma conta?',
                          style: TextStyles.textForm,
                        ),
                        TextButtonPrincipal(
                          onPressed: (){

                          },
                          text: 'Entrar',
                          textStyle: TextStyles.textLabelButtonBold,
                        ),
                      ],
                    ),
                    const SizedBox(height: 48,),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
