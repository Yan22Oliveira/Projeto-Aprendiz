import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_modular/flutter_modular.dart';

import './bloc/bloc.dart';
import '../../secretary.dart';
import '../../../../shared/shared.dart';

class ShepherdPage extends StatefulWidget {

  const ShepherdPage({Key? key}) : super(key: key);

  @override
  State<ShepherdPage> createState() => _ShepherdPageState();
}

class _ShepherdPageState extends State<ShepherdPage> {

  final _bloc = Modular.get<ShepherdBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(
      PesquisarPastores(
        pesquisa: '',
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pastores',
          style: TextStyles.titleAppBar,
        ),
      ),
      drawer: const CustomDrawerSecretary(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        tooltip: 'Cadastrar',
        child: const Icon(
          Icons.add,
          color: AppColors.background,
        ),
        onPressed: (){

        },
      ),
      body: BlocBuilder<ShepherdBloc,ShepherdState>(
        bloc: _bloc,
        builder: (context,state){

          if (state is ShepherdLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ShepherdError) {
            return const Center(
              child: Text("Erro ao carregar lista dos Pastores"),
            );
          }else if(state is ShepherdSucessful){

            List<ShepherdModel> listaShephers = state.lista;

            return ListView.builder(
              itemCount: listaShephers.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context,index){
                return Card(
                  elevation: 3,
                  color: Colors.white,
                  child: SizedBox(
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listaShephers[index].name!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );

          }

          return Container();

        },
      ),

    );
  }
}
