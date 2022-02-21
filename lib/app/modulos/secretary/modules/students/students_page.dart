import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../secretary.dart';
import '../../../../shared/shared.dart';

class StudentsPage extends StatefulWidget {

  const StudentsPage({Key? key}) : super(key: key);

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {

  final _bloc = Modular.get<StudentsBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(
      PesquisarStudents(
        pesquisa: '',
      ),
    );

    _bloc.stream.listen((state) async {

      if(state is StudentsNoConnection){
        await showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context){
            return PopupFailConnection(
              onPressed: (){
                Navigator.pop(context);
                _bloc.add(
                  PesquisarStudents(
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
                tradutor!.students,
                style: TextStyles.titleAppBar,
              ),
            ),
            drawer: sizeConfig.isMobile()? const CustomDrawerSecretary():null,
            body: BlocBuilder<StudentsBloc,StudentsState>(
              bloc: _bloc,
              builder: (context,state){

                if (state is StudentsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is StudentsError) {
                  return Center(
                    child: ErroPage(
                      text: tradutor.errorLoading,
                    ),
                  );
                }else if(state is StudentsSucessful){

                  List<StudentModel> listStudents = state.lista;

                  if(!sizeConfig.isMobile()){
                    return StudentsDataTableWeb(
                      listStudents: listStudents,
                    );
                  }else{
                    return StudentsDataTableMobile(
                      listStudents: listStudents,
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
