import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../secretary.dart';
import '../../../../shared/shared.dart';

class TeachersPage extends StatefulWidget {

  const TeachersPage({Key? key}) : super(key: key);

  @override
  State<TeachersPage> createState() => _TeachersPageState();
}

class _TeachersPageState extends State<TeachersPage> {

  final _bloc = Modular.get<TeachersBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(
      PesquisarTeachers(
        pesquisa: '',
      ),
    );

    _bloc.stream.listen((state) async {

      if(state is TeachersNoConnection){
        await showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context){
            return PopupFailConnection(
              onPressed: (){
                Navigator.pop(context);
                _bloc.add(
                  PesquisarTeachers(
                    pesquisa: '',
                  ),
                );
              },
            );
          },
        );
      }
    });

  }

  @override
  Widget build(BuildContext context) {

    var tradutor = AppLocalizations.of(context);
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));

    return Row(
      children: [
        if(!sizeConfig.isMobile())
          const CustomDrawerSecretary(),
        Expanded(
          child: Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(
              title: Text(
                tradutor!.teachers,
                style: TextStyles.titleAppBar,
              ),
            ),
            drawer: sizeConfig.isMobile()? const CustomDrawerSecretary():null,
            body: BlocBuilder<TeachersBloc,TeachersState>(
              bloc: _bloc,
              builder: (context,state){

                if (state is TeachersLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is TeachersError) {
                  return Center(
                    child: ErroPage(
                      text: tradutor.errorLoading,
                    ),
                  );
                }else if(state is TeachersSucessful){

                  List<TeacherModel> listTeachers = state.lista;

                  if(!sizeConfig.isMobile()){
                    return TeachersDataTableWeb(
                      listTeachers: listTeachers,
                    );
                  }else{
                    return TeachersDataTableMobile(
                      listTeachers: listTeachers,
                    );
                  }

                }

                return Container();

              },
            ),
          ),
        ),
      ],
    );
  }
}
