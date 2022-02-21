import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../secretary.dart';
import '../../../../shared/shared.dart';

class DropdownButtonArea extends StatefulWidget {

  final Function(AreaModel?)? onTap;
  const DropdownButtonArea({
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<DropdownButtonArea> createState() => _DropdownButtonAreaState();
}

class _DropdownButtonAreaState extends State<DropdownButtonArea> {

  final _bloc = Modular.get<AreaBloc>();

  String? valueArea;

  @override
  void initState() {
    super.initState();
    _bloc.add(
      PesquisarArea(
        pesquisa: '',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    var tradutor = AppLocalizations.of(context);

    return BlocBuilder<AreaBloc,AreaState>(
        bloc: _bloc,
        builder: (context,state){

          if(state is AreaLoading){

            return cardLoading();

          }else if(state is AreaSucessful){

            List<AreaModel> listaAreas = state.lista;

            return SizedBox(
              width: double.infinity,
              child: DropdownButtonFormField(
                dropdownColor: AppColors.background,
                decoration: decoration,
                isDense: true,
                elevation: 1,
                isExpanded: true,
                hint: Text(
                  tradutor!.selectTheArea,
                  style: TextStyles.textDropdownButton,
                ),
                icon: const Icon(
                  Icons.arrow_downward_outlined,
                  color: AppColors.primary,
                ),
                value: valueArea,
                onChanged: (dynamic condicao){
                  setState(() {
                    valueArea = condicao;
                  });
                },
                items: listaAreas.map((area) {
                  return DropdownMenuItem(
                    child: Text(
                      area.nome!,
                      style: TextStyles.titleCardLight,
                    ),
                    value: area.id!.toString(),
                    onTap: (){
                      widget.onTap!(area);
                    },
                  );
                }).toList(),
              ),
            );

          }

          return Container();

        }
    );
  }

  Widget cardLoading() {
    return SizedBox(
      width: double.infinity,
      child: DropdownButtonFormField(
        dropdownColor: AppColors.background,
        decoration: decoration,
        isDense: true,
        isExpanded: true,
        onChanged: (dynamic text){},
        hint: const LinearProgressIndicator(
          color: AppColors.primary,
        ),
        icon: Container(),
        items: [].map((regions) {
          return DropdownMenuItem(
            child: Container(),
          );
        }).toList(),
      ),
    );
  }

  var decoration = InputDecoration(
    isDense: true,
    border: OutlineInputBorder(
      borderSide: const BorderSide(),
      borderRadius: BorderRadius.circular(4),
    ),
  );
  
}
