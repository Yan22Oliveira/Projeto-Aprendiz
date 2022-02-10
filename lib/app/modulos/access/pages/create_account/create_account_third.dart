import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/shared.dart';

class CreateAccountThird extends StatelessWidget {

  const CreateAccountThird({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var tradutor = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: AppColors.background),
        title: Text(
          tradutor!.createAccont,
          style: TextStyles.titleAppBar,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          color: AppColors.background,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 500,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24,),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const [
                      SizedBox(height: 32,),
                      TimeLine(
                        colors: AppColors.green,
                        firstConfirmed: true,
                        secondConfirmed: true,
                      ),
                      SizedBox(height: 32,),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [

                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  TextForm(
                                    text: 'Cep',
                                  ),
                                  SizedBox(height: 8,),
                                  FormGeral(
                                    labelText: 'Informe seu CEP',
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8,),
                            Expanded(
                              flex: 20,
                              child: ButtonBorda(
                                onPressed: (){

                                },
                                icon: Icons.search,
                                color: AppColors.primary,
                              ),
                            ),

                          ],
                        ),
                      ),

                      const SizedBox(height: 16,),
                      const TextForm(
                        text: 'Endereço',
                      ),
                      const SizedBox(height: 8,),
                      const FormGeral(
                        labelText: 'Informe seu endereço',
                      ),
                      const SizedBox(height: 16,),
                      const TextForm(
                        text: 'Número',
                      ),
                      const SizedBox(height: 8,),
                      const FormGeral(
                        labelText: 'Informe seu número',
                      ),
                      const SizedBox(height: 16,),
                      const TextForm(
                        text: 'Complemento',
                      ),
                      const SizedBox(height: 8,),
                      const FormGeral(
                        labelText: 'Complemento',
                      ),
                      const SizedBox(height: 16,),
                      const TextForm(
                        text: 'Bairro',
                      ),
                      const SizedBox(height: 8,),
                      const FormGeral(
                        labelText: 'Informe seu bairro',
                      ),
                      const SizedBox(height: 16,),
                      Row(
                        children: [
                          Expanded(
                            flex: 60,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                TextForm(
                                  text: 'Cidade',
                                ),
                                SizedBox(height: 8,),
                                FormGeral(
                                  labelText: 'Cidade',
                                  enabled: false,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8,),
                          Expanded(
                            flex: 40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                TextForm(
                                  text: 'Estado',
                                ),
                                SizedBox(height: 8,),
                                FormGeral(
                                  labelText: 'UF',
                                  enabled: false,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                  const SizedBox(height: 40,),
                  Column(
                    children: [
                      ButtonPrincipal(
                        onPressed: (){
                          Modular.to.pushNamed('/access/login');
                        },
                        text: tradutor.register,
                      ),
                      const SizedBox(height: 100,),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
