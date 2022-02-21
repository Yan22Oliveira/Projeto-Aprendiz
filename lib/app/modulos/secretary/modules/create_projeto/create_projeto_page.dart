import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import './create_projeto_controller.dart';
import '../../../../shared/shared.dart';

class CreateProjetoPage extends StatefulWidget {

  const CreateProjetoPage({Key? key}) : super(key: key);

  @override
  State<CreateProjetoPage> createState() => _CreateProjetoPageState();
}

class _CreateProjetoPageState extends State<CreateProjetoPage> {

  @override
  Widget build(BuildContext context) {

    var tradutor = AppLocalizations.of(context);

    final controller = context.watch<CreateProjetoController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          tradutor!.apprenticeProjectData,
          style: TextStyles.titleAppBar,
        ),
      ),
      body: Container(
        color: AppColors.background,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Container(
                alignment: Alignment.center,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 400,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      const SizedBox(height: 16,),
                      TextForm(
                        text: tradutor.dateApprenticeProject,
                      ),
                      const SizedBox(height: 8,),
                      ButtonBorda(
                        text: (controller.selectDatesProjeto) ?
                        controller.datesProjeto!.datesFormatadas():
                        tradutor.date,
                        color:( controller.selectDatesProjeto)?
                        AppColors.blue:
                        AppColors.primary,
                        icon: (controller.selectDatesProjeto) ?
                        Icons.check_circle_outlined:
                        Icons.date_range_outlined,
                        onPressed: () async {

                          await showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context){
                              return PopupCalendar(
                                title: tradutor.dateApprenticeProject,
                                onPressed: (datesModel){
                                  if(datesModel!.validarCamposData()){
                                    controller.setDatesProjeto = datesModel;
                                  }else{
                                    controller.setDatesProjeto = null;
                                  }
                                },
                              );
                            },
                          );

                        },
                      ),

                      const SizedBox(height: 24,),
                      TextForm(
                        text: tradutor.teacherRegistrationDate,
                      ),
                      const SizedBox(height: 8,),
                      ButtonBorda(
                        text: (controller.selectDatesTeachers) ?
                        controller.datesTeachers!.datesFormatadas():
                        tradutor.date,
                        color:( controller.selectDatesTeachers)?
                        AppColors.blue:
                        AppColors.primary,
                        icon: (controller.selectDatesTeachers) ?
                        Icons.check_circle_outlined:
                        Icons.date_range_outlined,
                        onPressed: () async {

                          await showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context){
                              return PopupCalendar(
                                title: tradutor.teacherRegistrationDate,
                                onPressed: (datesModel){
                                  if(datesModel!.validarCamposData()){
                                    controller.setdatesTeachers = datesModel;
                                  }else{
                                    controller.setdatesTeachers = null;
                                  }
                                },
                              );
                            },
                          );

                        },
                      ),

                      const SizedBox(height: 24,),
                      TextForm(
                        text: tradutor.studentEnrollmentDate,
                      ),
                      const SizedBox(height: 8,),
                      ButtonBorda(
                        text: (controller.selectDatesStudents) ?
                        controller.datesStudents!.datesFormatadas():
                        tradutor.date,
                        color:( controller.selectDatesStudents)?
                        AppColors.blue:
                        AppColors.primary,
                        icon: (controller.selectDatesStudents) ?
                        Icons.check_circle_outlined:
                        Icons.date_range_outlined,
                        onPressed: () async {

                          await showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context){
                              return PopupCalendar(
                                title: tradutor.studentEnrollmentDate,
                                onPressed: (datesModel){
                                  if(datesModel!.validarCamposData()){
                                    controller.setDatesStudents = datesModel;
                                  }else{
                                    controller.setDatesStudents = null;
                                  }
                                },
                              );
                            },
                          );

                        },
                      ),

                      const SizedBox(height: 80,),
                      ButtonPrincipal(
                        text: tradutor.startApprenticeProject,
                        color: AppColors.green,
                        onPressed: (){

                        },
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
