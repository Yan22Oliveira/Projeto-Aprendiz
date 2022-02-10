import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../secretary.dart';
import '../../../../shared/shared.dart';

class AreaPage extends StatefulWidget {

  const AreaPage({Key? key}) : super(key: key);

  @override
  State<AreaPage> createState() => _AreaPageState();
}

class _AreaPageState extends State<AreaPage> {

  final _bloc = Modular.get<AreaBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(
      PesquisarArea(
        pesquisa: '',
      ),
    );

    _bloc.stream.listen((state) async {

      if(state is AreaNoConnection){
        await showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context){
            return PopupFailConnection(
              onPressed: (){
                Navigator.pop(context);
                _bloc.add(
                  PesquisarArea(
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

    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));
    var tradutor = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          tradutor!.area,
          style: TextStyles.titleAppBar,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        tooltip: tradutor.register,
        child: const Icon(
          Icons.add,
          color: AppColors.background,
        ),
        onPressed: (){
          //Modular.to.pushNamed('/secretary/create_pastor/');
        },
      ),
      body: BlocBuilder<AreaBloc,AreaState>(
        bloc: _bloc,
        builder: (context,state){

          if (state is AreaLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AreaError) {
            return Center(
              child: ErroPage(
                text: tradutor.errorLoading,
              ),
            );
          }else if(state is AreaSucessful){

            List<AreaModel> listaAreas = state.lista;

            if(sizeConfig.isTablet()){
              return AreaDataTableWeb(
                listaAreas: listaAreas,
              );
            }else{
              return AreaDataTableMobile(
                listaAreas: listaAreas,
              );
            }

          }

          return Container();

        },
      ),
    );
  }
}
