import 'package:flutter/material.dart';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../secretary.dart';
import '../../../../../../shared/shared.dart';

class AreaDataTableMobile extends StatefulWidget {

  final List<AreaModel> listaAreas;
  const AreaDataTableMobile({
    required this.listaAreas,
    Key? key,
  }) : super(key: key);

  @override
  State<AreaDataTableMobile> createState() => _AreaDataTableMobileState();
}

class _AreaDataTableMobileState extends State<AreaDataTableMobile> {

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var tradutor = AppLocalizations.of(context);

    return Scrollbar(
      isAlwaysShown: true,
      controller: _scrollController,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        controller: _scrollController,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor: MaterialStateProperty.all(AppColors.orange),
            headingRowHeight: 48,
            horizontalMargin: 24,
            columns: <DataColumn>[

              DataColumn(
                label: Text(
                  tradutor!.actions,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              DataColumn(
                label: Text(
                  tradutor.id,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              DataColumn2(
                label: Text(
                  tradutor.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                size: ColumnSize.L,
              ),

              DataColumn2(
                label: Text(
                  tradutor.region,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                size: ColumnSize.L,
              ),

            ],
            rows: widget.listaAreas.map(
                  (data) => DataRow(
                cells: [
                  DataCell(
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.green,
                          ),
                          tooltip: tradutor.edit,
                          onPressed: (){
                            //Modular.to.pushNamed('/secretary/edit_area/', arguments: data,);
                          },
                        ),
                      ],
                    ),
                  ),
                  DataCell(
                    Text(data.id!.toString()),
                  ),
                  DataCell(
                    Text(
                      data.nome!,
                    ),
                  ),
                  DataCell(
                    Text(
                      data.nomeRegiao!,
                    ),
                  ),
                ],
              ),
            ).toList(),
          ),
        ),
      ),
    );
  }

}
