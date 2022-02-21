import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:provider/provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../secretary.dart';
import '../../../../shared/shared.dart';

class CreateChurchPage extends StatefulWidget {

  const CreateChurchPage({Key? key}) : super(key: key);

  @override
  State<CreateChurchPage> createState() => _CreateChurchPageState();
}

class _CreateChurchPageState extends State<CreateChurchPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(debugLabel: '_createChurchKey');

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final controller = context.watch<CreateChurchController>();

    var tradutor = AppLocalizations.of(context);
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          tradutor!.registerChurch,
          style: TextStyles.titleAppBar,
        ),
      ),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      const SizedBox(height: 32,),

                      const TimeLineChurch(
                        colors: AppColors.green,
                        firstConfirmed: false,
                      ),

                      const SizedBox(height: 32,),

                      TextForm(
                        text: tradutor.churchName,
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
                        onTap: (regional){
                          controller.setRegion = regional;
                        },
                      ),

                      if(controller.selectRegion)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16,),
                          TextForm(
                            text: tradutor.area,
                          ),
                          const SizedBox(height: 8,),
                          DropdownButtonArea(
                            onTap: (area){

                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 40),

                      ButtonPrincipal(
                        onPressed: (){
                          //if(_formKey.currentState!.validate()){}
                          Modular.to.pushNamed('../create_churches_address/');
                          //Modular.to.pushNamed('church_address');
                        },
                        text: tradutor.next,
                        icon: Icons.arrow_forward_outlined,
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
