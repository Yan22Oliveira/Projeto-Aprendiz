import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:brasil_fields/brasil_fields.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../shared/shared.dart';

class CreatePastorPage extends StatefulWidget {

  const CreatePastorPage({Key? key}) : super(key: key);

  @override
  State<CreatePastorPage> createState() => _CreatePastorPageState();
}

class _CreatePastorPageState extends State<CreatePastorPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(debugLabel: '_createPastorKey');

  @override
  Widget build(BuildContext context) {

    var tradutor = AppLocalizations.of(context);
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          tradutor!.registerPastor,
          style: TextStyles.titleAppBar,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: GestureDetector(
            onTap: ()=> FocusScope.of(context).unfocus(),
            child: Container(
              alignment: Alignment.topCenter,
              color: AppColors.background,
              child: Form(
                key: _formKey,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 600,
                  ),
                  child: Column(
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
                        validator: (nome){
                          if(nome!.isEmpty) {
                            return tradutor.invalidField;
                          } else if(nome.trim().split(" ").length<2) {
                            return tradutor.enterTheFullName;
                          }
                          return null;
                        },
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
                        text: tradutor.telephone,
                      ),
                      const SizedBox(height: 8,),
                      FormGeral(
                        labelText: tradutor.telephone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter(),
                        ],
                        validator: (telefone) {
                          if (telefone!.isNotEmpty){
                            if (Formatters().clearPhoneCharacters(telefone).length<10) {
                              return tradutor.invalidPhone;
                            }
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 80),

                      ButtonPrincipal(
                        onPressed: (){
                          if(_formKey.currentState!.validate()){}
                        },
                        text: tradutor.save.toUpperCase(),
                      ),

                      const SizedBox(height: 32,),

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
