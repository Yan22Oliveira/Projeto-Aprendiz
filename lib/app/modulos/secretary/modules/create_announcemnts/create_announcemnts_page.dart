import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../shared/shared.dart';

class CreateAnnouncemntsPage extends StatefulWidget {

  const CreateAnnouncemntsPage({Key? key}) : super(key: key);

  @override
  State<CreateAnnouncemntsPage> createState() => _CreateAnnouncemntsPageState();
}

class _CreateAnnouncemntsPageState extends State<CreateAnnouncemntsPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(debugLabel: '_createAnnouncemntsKey');

  @override
  Widget build(BuildContext context) {

    var tradutor = AppLocalizations.of(context);
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          tradutor!.createAnnouncement,
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
                        text: tradutor.title,
                      ),
                      const SizedBox(height: 8,),
                      FormGeral(
                        labelText: tradutor.title,
                        keyboardType: TextInputType.name,
                        autocorrect: false,
                        validator: (title){
                          if(title!.isEmpty) {
                            return tradutor.invalidField;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16,),
                      TextForm(
                        text: tradutor.caption,
                      ),
                      const SizedBox(height: 8,),
                      FormGeral(
                        labelText: tradutor.caption,
                        keyboardType: TextInputType.text,
                        autocorrect: false,
                        validator: (text){
                          if(text!.isEmpty) {
                            return tradutor.invalidField;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16,),
                      TextForm(
                        text: tradutor.text,
                      ),
                      const SizedBox(height: 8,),
                      FormGeral(
                        //labelText: tradutor.text,
                        maxLines: 6,
                        validator: (text){
                          if(text!.isEmpty) {
                            return tradutor.invalidField;
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 60,),

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
