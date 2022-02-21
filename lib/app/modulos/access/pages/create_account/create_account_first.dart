import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/shared.dart';

class CreateAccountFirst extends StatefulWidget {

  const CreateAccountFirst({Key? key}) : super(key: key);

  @override
  State<CreateAccountFirst> createState() => _CreateAccountFirstState();
}

class _CreateAccountFirstState extends State<CreateAccountFirst> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(debugLabel: '_firstFormKey');

  @override
  Widget build(BuildContext context) {

    var tradutor = AppLocalizations.of(context);
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          tradutor!.createAccont,
          style: TextStyles.titleAppBar,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: GestureDetector(
            onTap: ()=> FocusScope.of(context).unfocus(),
            child: Container(
              alignment: Alignment.topCenter,
              color: AppColors.background,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 400,
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
                          ),
                        ],
                      ),
                      const SizedBox(height: 40,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextForm(
                            text: tradutor.fullName,
                          ),
                          const SizedBox(height: 8,),
                          FormGeral(
                            labelText: tradutor.name,
                            keyboardType: TextInputType.name,
                            autocorrect: false,
                          ),
                          const SizedBox(height: 16,),
                          TextForm(
                            text: tradutor.email,
                          ),
                          const SizedBox(height: 8,),
                          FormGeral(
                            labelText: tradutor.email,
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
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
                          const SizedBox(height: 16,),
                          TextForm(
                            text: tradutor.confirmPassword,
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
                        ],
                      ),

                      const SizedBox(height: 80,),

                      Column(
                        children: [
                          ButtonPrincipal(
                            onPressed: (){
                              //if(_formKey.currentState!.validate())
                              Modular.to.pushNamed('/access/create_account_second');
                            },
                            text: tradutor.next,
                            icon: Icons.arrow_forward_outlined,
                          ),
                          const SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                tradutor.alreadyHaveAnAccount,
                                style: TextStyles.textForm,
                              ),
                              TextButtonPrincipal(
                                onPressed: (){
                                  Modular.to.navigate('/access/login');
                                },
                                text: tradutor.enter,
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
      ),
    );
  }
}
