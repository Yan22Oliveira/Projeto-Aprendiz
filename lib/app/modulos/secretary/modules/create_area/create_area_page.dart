import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../secretary.dart';
import '../../../../shared/shared.dart';

class CreateAreaPage extends StatefulWidget {

  const CreateAreaPage({Key? key}) : super(key: key);

  @override
  State<CreateAreaPage> createState() => _CreateAreaPageState();
}

class _CreateAreaPageState extends State<CreateAreaPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(debugLabel: '_createAreaKey');

  @override
  Widget build(BuildContext context) {

    var tradutor = AppLocalizations.of(context);
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          tradutor!.registerArea,
          style: TextStyles.titleAppBar,
        ),
      ),
      body: GestureDetector(
        onTap: ()=> FocusScope.of(context).unfocus(),
        child: Container(
          color: AppColors.background,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Container(
                  alignment: Alignment.center,
                  child: Form(
                    key: _formKey,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 600,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          TextForm(
                            text: tradutor.areaName,
                          ),
                          const SizedBox(height: 8,),
                          FormGeral(
                            labelText: tradutor.name,
                            keyboardType: TextInputType.name,
                            autocorrect: false,
                            validator: (nome){
                              if(nome!.isEmpty) {
                                return tradutor.invalidField;
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 16,),
                          TextForm(
                            text: tradutor.region,
                          ),
                          const SizedBox(height: 8,),

                          DropdownButtonRegion(
                            onTap: (regioonal){

                            },
                          ),

                          const SizedBox(height: 40),

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
        ),
      ),
    );
  }
}
