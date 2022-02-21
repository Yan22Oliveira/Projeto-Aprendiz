import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/shared.dart';

class CreateCruchAddressPage extends StatelessWidget {

  const CreateCruchAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var tradutor = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: AppColors.background),
        title: Text(
          tradutor!.registerChurch,
          style: TextStyles.titleAppBar,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          color: AppColors.background,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24,),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 400,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const [
                      SizedBox(height: 32,),
                      TimeLineChurch(
                        colors: AppColors.green,
                        firstConfirmed: true,
                      ),
                      SizedBox(height: 32,),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [

                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextForm(
                                    text: tradutor.zip,
                                  ),
                                  const SizedBox(height: 8,),
                                  FormGeral(
                                    labelText: tradutor.churchZipCode,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8,),
                            Expanded(
                              flex: 20,
                              child: ButtonBorda(
                                onPressed: (){

                                },
                                icon: Icons.search,
                                color: AppColors.primary,
                              ),
                            ),

                          ],
                        ),
                      ),

                      const SizedBox(height: 16,),
                      TextForm(
                        text: tradutor.address,
                      ),
                      const SizedBox(height: 8,),
                      FormGeral(
                        labelText: tradutor.churchAddress,
                      ),
                      const SizedBox(height: 16,),
                      TextForm(
                        text: tradutor.number,
                      ),
                      const SizedBox(height: 8,),
                      FormGeral(
                        labelText: tradutor.number,
                      ),
                      const SizedBox(height: 16,),
                      TextForm(
                        text: tradutor.complement,
                      ),
                      const SizedBox(height: 8,),
                      FormGeral(
                        labelText: tradutor.complement,
                      ),
                      const SizedBox(height: 16,),
                      TextForm(
                        text: tradutor.neighborhood,
                      ),
                      const SizedBox(height: 8,),
                      FormGeral(
                        labelText: tradutor.neighborhood,
                      ),
                      const SizedBox(height: 16,),
                      Row(
                        children: [
                          Expanded(
                            flex: 60,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextForm(
                                  text: tradutor.city,
                                ),
                                const SizedBox(height: 8,),
                                FormGeral(
                                  labelText: tradutor.city,
                                  enabled: false,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8,),
                          Expanded(
                            flex: 40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextForm(
                                  text: tradutor.state,
                                ),
                                const SizedBox(height: 8,),
                                FormGeral(
                                  labelText: tradutor.uf,
                                  enabled: false,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                  const SizedBox(height: 40,),
                  Column(
                    children: [
                      ButtonPrincipal(
                        onPressed: (){

                        },
                        text: tradutor.register,
                      ),
                      const SizedBox(height: 100,),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
