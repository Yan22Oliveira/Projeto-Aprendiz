import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../secretary.dart';
import '../../../../shared/shared.dart';

class CoursePage extends StatefulWidget {

  const CoursePage({Key? key}) : super(key: key);

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {

  final _bloc = Modular.get<CourseBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(
      PesquisarCourse(
        pesquisa: '',
      ),
    );

    _bloc.stream.listen((state) async {

      if(state is CourseNoConnection){
        await showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context){
            return PopupFailConnection(
              onPressed: (){
                Navigator.pop(context);
                _bloc.add(
                  PesquisarCourse(
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
                tradutor!.courses,
                style: TextStyles.titleAppBar,
              ),
            ),
            drawer: sizeConfig.isMobile()? const CustomDrawerSecretary():null,
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.primary,
              tooltip: tradutor.register,
              child: const Icon(
                Icons.add,
                color: AppColors.background,
              ),
              onPressed: (){
                Modular.to.pushNamed('/secretary/create_course/');
              },
            ),
            body: BlocBuilder<CourseBloc,CourseState>(
              bloc: _bloc,
              builder: (context,state){

                if (state is CourseLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is CourseError) {
                  return Center(
                    child: ErroPage(
                      text: tradutor.errorLoading,
                    ),
                  );
                }else if(state is CourseSucessful){

                  List<CourseModel> listaCourses = state.lista;

                  return CourseDataTableWeb(
                    listaCourses: listaCourses,
                  );

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
