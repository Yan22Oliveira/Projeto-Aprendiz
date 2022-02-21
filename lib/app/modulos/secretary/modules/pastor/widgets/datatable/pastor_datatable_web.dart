import 'package:flutter/material.dart';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../pastor.dart';
import '../../../../../../shared/shared.dart';

class PastorDataTableWeb extends StatefulWidget {

 final List<PastorModel> listaShephers;
  const PastorDataTableWeb({
    required this.listaShephers,
    Key? key,
  }) : super(key: key);

  @override
  State<PastorDataTableWeb> createState() => _PastorDataTableWebeState();
}

class _PastorDataTableWebeState extends State<PastorDataTableWeb> {

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var tradutor = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: DataTable2(
        scrollController: _scrollController,
        headingRowColor: MaterialStateProperty.all(AppColors.orange),
        headingRowHeight: 48,
        horizontalMargin: 24,
        empty: empty(context,tradutor!),
        columns: <DataColumn>[

          DataColumn(
            label: Text(
              tradutor.actions,
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
              tradutor.email,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            size: ColumnSize.L,
          ),

          DataColumn2(
            label: Text(
              tradutor.telephone,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            size: ColumnSize.L,
          ),

        ],
        rows: widget.listaShephers.map(
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

                        Modular.to.pushNamed(
                          '/secretary/edit_pastor/',
                          arguments: data,
                        );

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
                  data.name!,
                ),
              ),
              DataCell(
                Text(
                  data.email!,
                ),
              ),
              DataCell(
                Text(
                  Formatters().formatPhone(data.telefone!),
                ),
              ),
            ],
          ),
        ).toList(),
      ),
    );
  }

 Widget empty(BuildContext context,AppLocalizations tradutor){
   return Center(
     child: Padding(
       padding: const EdgeInsets.symmetric(vertical: 40),
       child: Text(tradutor.noDataAvailable),
     ),
   );
 }
}
