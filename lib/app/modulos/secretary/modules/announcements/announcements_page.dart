import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../secretary.dart';
import '../../../../shared/shared.dart';

class AnnouncementsPage extends StatefulWidget {

  const AnnouncementsPage({Key? key}) : super(key: key);

  @override
  State<AnnouncementsPage> createState() => _AnnouncementsPageState();
}

class _AnnouncementsPageState extends State<AnnouncementsPage> {

  final _bloc = Modular.get<AnnouncementsBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(
      PesquisarComunicados(
        pesquisa: '',
      ),
    );

    _bloc.stream.listen((state) async {

      if(state is AnnouncementsNoConnection){
        await showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context){
            return PopupFailConnection(
              onPressed: (){
                Navigator.pop(context);
                _bloc.add(
                  PesquisarComunicados(
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

    return Scaffold(
      backgroundColor: AppColors.greyLight,
      appBar: AppBar(
        title: Text(
          tradutor!.announcements,
          style: TextStyles.titleAppBar,
        ),
      ),
      drawer: const CustomDrawerSecretary(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        tooltip: tradutor.createAnnouncement,
        child: const Icon(
          Icons.add,
          color: AppColors.background,
        ),
        onPressed: (){
          Modular.to.pushNamed(
            '/secretary/create_announcemnts/',
          );
        },
      ),
      body: BlocBuilder<AnnouncementsBloc,AnnouncementsState>(
          bloc: _bloc,
          builder: (context,state){

            if (state is AnnouncementsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AnnouncementsError) {
              return Center(
                child: ErroPage(
                  text: tradutor.errorLoadingAnnouncementsList,
                ),
              );
            }else if(state is AnnouncementsSucessful){

              List<AnnouncementsModel> listaAnnouncements = state.lista;

              return Container(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 600,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: ListView.builder(
                      itemCount: listaAnnouncements.length,
                      itemBuilder: (context, index){
                        return CardAnnouncements(
                          announcementsModel: listaAnnouncements[index],
                          onTap: (){
                            Modular.to.pushNamed(
                              '/secretary/view_announcements/',
                              arguments: listaAnnouncements[index],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              );

            }

            return Container();

        }
      ),
    );

  }
}
