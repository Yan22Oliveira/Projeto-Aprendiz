import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../secretary.dart';
import '../../../../shared/shared.dart';

class PastorPage extends StatefulWidget {

  const PastorPage({Key? key}) : super(key: key);

  @override
  State<PastorPage> createState() => _PastorPageState();
}

class _PastorPageState extends State<PastorPage> {

  final _bloc = Modular.get<PastorBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(
      PesquisarPastores(
        pesquisa: '',
      ),
    );

    _bloc.stream.listen((state) async {

      if(state is PastorNoConnection){
        await showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context){
            return PopupFailConnection(
              onPressed: (){
                Navigator.pop(context);
                _bloc.add(
                  PesquisarPastores(
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

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          tradutor!.pastors,
          style: TextStyles.titleAppBar,
        ),
      ),
      drawer: const CustomDrawerSecretary(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        tooltip: tradutor.register,
        child: const Icon(
          Icons.add,
          color: AppColors.background,
        ),
        onPressed: (){
          Modular.to.pushNamed('/secretary/create_pastor/');
        },
      ),
      body: BlocBuilder<PastorBloc,PastorState>(
        bloc: _bloc,
        builder: (context,state){

          if (state is PastorLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PastorError) {
            return Center(
              child: ErroPage(
                text: tradutor.errorLoadingPastorsList,
              ),
            );
          }else if(state is PastorSucessful){

            List<PastorModel> listaShephers = state.lista;

            if(sizeConfig.isTablet()){
              return PastorDataTableWeb(
                listaShephers: listaShephers,
              );
            }else{
              return PastorDataTableMobile(
                listaShephers: listaShephers,
              );
            }

          }

          return Container();

        },
      ),

    );
  }
}
