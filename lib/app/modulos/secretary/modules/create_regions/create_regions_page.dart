import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../shared/shared.dart';

class CreateRegionsPage extends StatefulWidget {

  const CreateRegionsPage({Key? key}) : super(key: key);

  @override
  State<CreateRegionsPage> createState() => _CreateRegionsPageState();
}

class _CreateRegionsPageState extends State<CreateRegionsPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(debugLabel: '_createRegionsKey');

  @override
  Widget build(BuildContext context) {

    var tradutor = AppLocalizations.of(context);
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          tradutor!.registerRegions,
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
                            text: tradutor.regionName,
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
