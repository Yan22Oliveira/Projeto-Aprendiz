import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../shared/shared.dart';

class CreateAccountThird extends StatelessWidget {

  const CreateAccountThird({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var tradutor = AppLocalizations.of(context);
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));

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
        child: SizedBox(
          height: sizeConfig.height(),
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
                      firstConfirmed: true,
                      secondConfirmed: true,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [

                    TextForm(
                      text: 'Cep',
                    ),
                    SizedBox(height: 8,),
                    FormGeral(
                      labelText: 'Informe seu CEP',
                    ),
                    SizedBox(height: 16,),
                    TextForm(
                      text: 'Endereço',
                    ),
                    SizedBox(height: 8,),
                    FormGeral(
                      labelText: 'Informe seu endereço',
                    ),
                    SizedBox(height: 16,),
                    TextForm(
                      text: 'Número',
                    ),
                    SizedBox(height: 8,),
                    FormGeral(
                      labelText: 'Informe seu número',
                    ),
                    SizedBox(height: 16,),
                    TextForm(
                      text: 'Complemento',
                    ),
                    SizedBox(height: 8,),
                    FormGeral(
                      labelText: 'Complemento',
                    ),

                  ],
                ),
                Column(
                  children: [
                    ButtonPrincipal(
                      onPressed: (){

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
    );
  }
}
