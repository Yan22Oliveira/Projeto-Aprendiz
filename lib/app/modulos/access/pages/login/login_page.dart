import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/shared.dart';

class LoginPage extends StatelessWidget {

  LoginPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey =
    GlobalKey<FormState>(debugLabel: '_loginFormKey');

  @override
  Widget build(BuildContext context) {

    var tradutor = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24,),
          child: GestureDetector(
            onTap: ()=> FocusScope.of(context).unfocus(),
            child: Container(
              alignment: Alignment.topCenter,
              color: AppColors.background,
              child: Form(
                key: _formKey,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 400,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          AppImages.logoDiv,
                          alignment: Alignment.center,
                          height: 320,
                        ),
                      ),
                      TextForm(
                        text: tradutor!.enterYourEmail,
                      ),
                      const SizedBox(height: 8,),
                      FormGeral(
                        labelText: tradutor.email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (email){
                          if(email!.isEmpty) {
                            return tradutor.invalidField;
                          }else if(!Utils().isEmailValid(email)){
                            return tradutor.invalidEmail;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16,),
                      TextForm(
                        text: tradutor.informYourPassword,
                      ),
                      const SizedBox(height: 8,),
                      FormGeral(
                        labelText: tradutor.password,
                        password: true,
                        validator: (password){
                          if(password!.isEmpty) {
                            return tradutor.invalidField;
                          }else if(password.length<7){
                            return tradutor.minimumCharacters;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8,),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: TextButtonPrincipal(
                          onPressed: (){

                          },
                          text: tradutor.forgotPassword,
                        ),
                      ),
                      const SizedBox(height: 40,),
                      ButtonPrincipal(
                        onPressed: () async {

                          //if(_formKey.currentState!.validate()){}

                          Modular.to.navigate('/home/');

                        },
                        text: tradutor.authenticate,
                      ),
                      const SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            tradutor.dontHaveAnAccount,
                            style: TextStyles.textForm,
                          ),
                          TextButtonPrincipal(
                            onPressed: (){
                              Modular.to.navigate('/access/creat_account');
                            },
                            text: tradutor.createAccont,
                            textStyle: TextStyles.textLabelButtonBold,
                          ),
                        ],
                      ),

                      const SizedBox(height: 32,),

                      Container(
                        alignment: Alignment.center,
                        child: const DropdownButtonLocale(),
                      ),

                      const SizedBox(height: 40,),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
