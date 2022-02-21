import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../secretary.dart';
import '../../../../shared/shared.dart';

class DropdownButtonRegion extends StatefulWidget {

  final Function(RegionsModel?)? onTap;
  const DropdownButtonRegion({
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<DropdownButtonRegion> createState() => _DropdownButtonRegionState();
}

class _DropdownButtonRegionState extends State<DropdownButtonRegion> {

  final _bloc = Modular.get<RegionsBloc>();

  String? valueRegion;

  @override
  void initState() {
    super.initState();
    _bloc.add(
      PesquisarRegions(
        pesquisa: '',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    var tradutor = AppLocalizations.of(context);

    return BlocBuilder<RegionsBloc,RegionsState>(
        bloc: _bloc,
        builder: (context,state){

          if(state is RegionsLoading){

            return cardLoading();

          }else if(state is RegionsSucessful){

            List<RegionsModel> listaRegions = state.lista;

            return SizedBox(
              width: double.infinity,
              child: DropdownButtonFormField(
                dropdownColor: AppColors.background,
                decoration: decoration,
                isDense: true,
                elevation: 1,
                isExpanded: true,
                hint: Text(
                  tradutor!.selectRegion,
                  style: TextStyles.textDropdownButton,
                ),
                icon: const Icon(
                  Icons.arrow_downward_outlined,
                  color: AppColors.primary,
                ),
                value: valueRegion,
                onChanged: (dynamic condicao){
                  setState(() {
                    valueRegion = condicao;
                  });
                },
                items: listaRegions.map((regions) {
                  return DropdownMenuItem(
                    child: Text(
                      regions.nome!,
                      style: TextStyles.titleCardLight,
                    ),
                    value: regions.id!.toString(),
                    onTap: (){
                      widget.onTap!(regions);
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
