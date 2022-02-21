import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../secretary.dart';
import '../../../../shared/shared.dart';

class HomeSecretaryPage extends StatefulWidget {

  const HomeSecretaryPage({Key? key}) : super(key: key);

  @override
  State<HomeSecretaryPage> createState() => _HomeSecretaryPageState();
}

class _HomeSecretaryPageState extends State<HomeSecretaryPage> {

  final _bloc = Modular.get<HomeBloc>();

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _bloc.add(
      PesquisarInformacoes(
        pesquisa: '',
      ),
    );

    _bloc.stream.listen((state) async {

      if(state is HomeSecretaryNoConnection){
        await showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context){
            return PopupFailConnection(
              onPressed: (){
                Navigator.pop(context);
                _bloc.add(
                  PesquisarInformacoes(
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

    final controller = context.watch<CreateProjetoController>();

    return Row(
      children: [
        if(!sizeConfig.isMobile())
        const CustomDrawerSecretary(),
        Expanded(
          child: Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(
              backgroundColor: AppColors.primary,
              title: Text(
                tradutor!.secretary,
                style: TextStyles.titleAppBar,
              ),
              centerTitle: true,
              elevation: 0,
              iconTheme: const IconThemeData(
                color: AppColors.background,
              ),
            ),
            drawer: sizeConfig.isMobile()? const CustomDrawerSecretary():null,
            body: Column(
              children: [

                BlocBuilder <HomeBloc,HomeSecretaryState>(
                    bloc: _bloc,
                    builder: (context,state){

                      if (state is HomeSecretaryLoading) {
                        return const Expanded(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (state is HomeSecretaryError) {
                        return Expanded(
                          child: Center(
                            child: ErroPage(
                              text: tradutor.errorLoading,
                            ),
                          ),
                        );
                      }else if (state is HomeSecretaryEmpty) {
                        return Expanded(
                          child: Center(
                            child: Container(
                              alignment: Alignment.center,
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxWidth: 400,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 24),
                                      child: Image.asset(
                                        AppImages.logo,
                                      ),
                                    ),

                                    const SizedBox(height: 56,),

                                    Text(
                                      tradutor.thereIsNoApprenticeProjectStarted,
                                      textAlign: TextAlign.center,
                                      style: TextStyles.titleCard,
                                    ),

                                    const SizedBox(height: 24,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 24),
                                      child: ButtonPrincipal(
                                        text: tradutor.startApprenticeProject,
                                        color: AppColors.green,
                                        onPressed: (){
                                          controller.clean();
                                          Modular.to.pushNamed('/secretary/create_projeto/');
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }else if(state is HomeSecretarySucessful){

                        List<InformacaoModel> listInformacoes = state.home.listInformacoes;

                        HomeModel home =  state.home;

                        return Expanded(
                          child: Column(
                            children: [
                              
                              const Divider(),

                              Expanded(
                                child: SingleChildScrollView(
                                  controller: _scrollController,
                                  child: Padding(
                                    padding: const EdgeInsets.all(24),
                                    child: Wrap(
                                      crossAxisAlignment: WrapCrossAlignment.start,
                                      alignment: WrapAlignment.start,
                                      spacing: 8,
                                      children: listInformacoes.map((informacoes) {
                                        return CardHome(
                                          informacao: informacoes,
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );

                      }

                      return Container();

                    }
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
