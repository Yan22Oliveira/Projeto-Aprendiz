import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../shared/shared.dart';

class CreateAccountFirst extends StatefulWidget {

  const CreateAccountFirst({Key? key}) : super(key: key);

  @override
  State<CreateAccountFirst> createState() => _CreateAccountFirstState();
}

class _CreateAccountFirstState extends State<CreateAccountFirst> {

  final GlobalKey<FormState> _formKeyAccount = GlobalKey<FormState>(debugLabel: '_firstFormKey');

  @override
  Widget build(BuildContext context) {

    var altura = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          AppLocalizations.of(context)!.createAccont,
          style: TextStyles.titleAppBar,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKeyAccount,
          child: GestureDetector(
            onTap: ()=> FocusScope.of(context).unfocus(),
            child: Container(
              height: altura - 50,
              color: AppColors.background,
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
                      children: [
                        TextForm(
                          text: AppLocalizations.of(context)!.email,
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
                        const SizedBox(height: 16,),
                        TextForm(
                          text: AppLocalizations.of(context)!.confirmPassword,
                        ),
                        const SizedBox(height: 8,),
                        FormGeral(
                          labelText: AppLocalizations.of(context)!.password,
                          password: true,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ButtonPrincipal(
                          onPressed: (){

                          },
                          text: AppLocalizations.of(context)!.next,
                          icon: Icons.arrow_forward_outlined,
                        ),
                        const SizedBox(height: 4,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.alreadyHaveAnAccount,
                              style: TextStyles.textForm,
                            ),
                            TextButtonPrincipal(
                              onPressed: (){

                              },
                              text: AppLocalizations.of(context)!.enter,
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
        ),
      ),
    );
  }
}
