import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../secretary.dart';
import '../../../../shared/shared.dart';

class RegionsPage extends StatefulWidget {

  const RegionsPage({Key? key}) : super(key: key);

  @override
  State<RegionsPage> createState() => _RegionsPageState();
}

class _RegionsPageState extends State<RegionsPage> {

  final _bloc = Modular.get<RegionsBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(
      PesquisarRegions(
        pesquisa: '',
      ),
    );

    _bloc.stream.listen((state) async {

      if(state is RegionsNoConnection){
        await showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context){
            return PopupFailConnection(
              onPressed: (){
                Navigator.pop(context);
                _bloc.add(
                  PesquisarRegions(
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
          tradutor!.regions,
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
      body: BlocBuilder<RegionsBloc,RegionsState>(
        bloc: _bloc,
        builder: (context,state){

          if (state is RegionsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is RegionsError) {
            return Center(
              child: ErroPage(
                text: tradutor.errorLoading,
              ),
            );
          }else if(state is RegionsSucessful){

            List<RegionsModel> listaRegions = state.lista;

            return RegionsDataTableWeb(
              listaRegions: listaRegions,
            );

          }

          return Container();

        },
      ),
    );
  }
}
