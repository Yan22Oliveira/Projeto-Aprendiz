import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../shared/shared.dart';

class CreateAccountSecond extends StatelessWidget {

  const CreateAccountSecond({Key? key}) : super(key: key);

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
                      colors: AppColors.green,
                      firstConfirmed: true,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    TextForm(
                      text: tradutor.telephone,
                    ),
                    const SizedBox(height: 8,),
                    const FormGeral(
                      labelText: '(00) 00000-0000',
                    ),
                    const SizedBox(height: 16,),
                    TextForm(
                      text: tradutor.dateOfBirth,
                    ),
                    const SizedBox(height: 8,),
                    ButtonBorda(
                      onPressed: (){

                      },
                      text: tradutor.selectYourDate,
                      color: AppColors.primary,
                      icon: Icons.date_range_outlined,
                    ),
                    const SizedBox(height: 16,),
                    TextForm(
                      text: tradutor.church,
                    ),
                    const SizedBox(height: 8,),
                    ButtonBorda(
                      onPressed: (){

                      },
                      text: tradutor.selectYourChurch,
                      color: AppColors.primary,
                      icon: Icons.arrow_downward_outlined,
                    ),
                    const SizedBox(height: 16,),
                    TextForm(
                      text: tradutor.classe,
                    ),
                    const SizedBox(height: 8,),
                    ButtonBorda(
                      onPressed: (){

                      },
                      text: tradutor.selectYourClass,
                      color: AppColors.primary,
                      icon: Icons.arrow_downward_outlined,
                    ),
                  ],
                ),
                Column(
                  children: [
                    ButtonPrincipal(
                      onPressed: (){
                        Navigator.pushNamed(context, '/createAccountThird');
                      },
                      text: tradutor.next,
                      icon: Icons.arrow_forward_outlined,
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
