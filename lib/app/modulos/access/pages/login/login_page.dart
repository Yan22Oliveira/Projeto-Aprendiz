import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            TextForm(
              text: AppLocalizations.of(context)!.enterYourEmail,
            ),
            const SizedBox(height: 8,),
            FormGeral(
              labelText: AppLocalizations.of(context)!.email,
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
            ),
            const SizedBox(height: 16,),
            TextForm(
              text: AppLocalizations.of(context)!.informYourPassword,
            ),
            const SizedBox(height: 8,),
            FormGeral(
              labelText: AppLocalizations.of(context)!.password,
              password: true,
            ),
            const SizedBox(height: 8,),
            Container(
              alignment: Alignment.bottomRight,
              child: TextButtonPrincipal(
                onPressed: (){

                },
                text: AppLocalizations.of(context)!.forgotPassword,
              ),
            ),
            const SizedBox(height: 40,),
            ButtonPrincipal(
              onPressed: (){

              },
              text: AppLocalizations.of(context)!.authenticate,
            ),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.dontHaveAnAccount,
                  style: TextStyles.textForm,
                ),
                TextButtonPrincipal(
                  onPressed: (){

                  },
                  text: AppLocalizations.of(context)!.createAccont,
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
