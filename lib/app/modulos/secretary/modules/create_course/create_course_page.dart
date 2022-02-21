import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:brasil_fields/brasil_fields.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../shared/shared.dart';

class CreateCoursePage extends StatefulWidget {

  const CreateCoursePage({Key? key}) : super(key: key);

  @override
  State<CreateCoursePage> createState() => _CreateCoursePageState();
}

class _CreateCoursePageState extends State<CreateCoursePage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(debugLabel: '_createCourseKey');

  @override
  Widget build(BuildContext context) {

    var tradutor = AppLocalizations.of(context);
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          tradutor!.registerCourse,
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
                        children: [

                          TextForm(
                            text: tradutor.courseName,
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
