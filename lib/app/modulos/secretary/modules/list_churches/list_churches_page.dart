import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../secretary.dart';
import '../../../../shared/shared.dart';

class ListChurchesPage extends StatefulWidget {

  const ListChurchesPage({Key? key}) : super(key: key);

  @override
  State<ListChurchesPage> createState() => _ListChurchesPageState();
}

class _ListChurchesPageState extends State<ListChurchesPage> {

  final _bloc = Modular.get<ListChurchesBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(
      PesquisarListChurches(
        pesquisa: '',
      ),
    );

    _bloc.stream.listen((state) async {

      if(state is ListChurchesNoConnection){
        await showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context){
            return PopupFailConnection(
              onPressed: (){
                Navigator.pop(context);
                _bloc.add(
                  PesquisarListChurches(
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

    final controller = context.watch<CreateChurchController>();

    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));
    var tradutor = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          tradutor!.churches,
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
          controller.region = null;
          Modular.to.pushNamed('/secretary/church/create_churches/');
        },
      ),
      body: BlocBuilder<ListChurchesBloc,ListChurchesState>(
        bloc: _bloc,
        builder: (context,state){

          if (state is ListChurchesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ListChurchesError) {
            return Center(
              child: ErroPage(
                text: tradutor.errorLoading,
              ),
            );
          }else if(state is ListChurchesSucessful){

            List<ChurchModel> listChurches = state.lista;

            if(!sizeConfig.isMobile()){
              return ListChurchesDataTableWeb(
                listChurches: listChurches,
              );
            }else{
              return ListChurchesDataTableMobile(
                listChurches: listChurches,
              );
            }

          }

          return Container();

        },
      ),
    );
  }
}
