import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:multiple_search_selection/multiple_search_selection.dart';
import 'package:pucextrato/app/modules/extratoProjetos/controllers/extrato_projetos_controller.dart';
import 'package:pucextrato/app/modules/general/config.dart';
import 'package:pucextrato/app/modules/projetos/controllers/projetos_controller.dart';

import '../controllers/extrato_multi_controller.dart';

// ignore: must_be_immutable
class ExtratoMultiView extends GetView<ExtratoMultiController> {
  ExtratoMultiView({super.key});
  final ProjetosController projetos = Get.put(ProjetosController());
  static ConfigController config = Get.put(ConfigController());
  ExtratoProjetosController extrato = Get.put(ExtratoProjetosController());
  @override
  Widget build(BuildContext context) {
    RxInt selectedProjects = 0.obs;
    List<DropDownValueModel> projetosSelecionados = [];
    TextStyle kStyleDefault = const TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    //final RxList<PlutoRow> rows = extrato.rows;
    MultipleSearchController searchController = MultipleSearchController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                config.wgtDataInicial(context),
                const SizedBox(
                  width: 10,
                ),
                config.wgtDataFinal(context),
                Expanded(
                  flex: 1,
                  child: AnimatedButtonBar(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color.fromARGB(255, 11, 71, 13),
                    radius: 8.0,
                    padding: const EdgeInsets.all(8.0),
                    invertedSelection: true,
                    children: [
                      ButtonBarEntry(
                        onTap: () async {
                          for (DropDownValueModel p in projetosSelecionados) {
                            projetos.idProjeto.value = p.value;
                            extrato.getProjetoExcel();
                          }
                          searchController.clearAllPickedItems();
                          searchController.clearSearchField();
                          projetosSelecionados = [];
                        },
                        child: const Text('Exportar Excel'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            MultipleSearchSelection<DropDownValueModel>(
              hintText: 'Digite o nome do projeto ou selecione na lista abaixo',
              controller: searchController,
              searchField: TextField(
                decoration: InputDecoration(
                  hintText: 'Procurar projetos',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              onSearchChanged: (text) {
                print('Text is $text');
              },
              items: projetos.dropDownList, // List<Country>
              fieldToCheck: (c) {
                return c.name; // String
              },
              itemBuilder: (pr, p) {
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Text(pr.name),
                    ),
                  ),
                );
              },
              pickedItemBuilder: (pr) {
                selectedProjects.value =
                    searchController.getPickedItems().length;
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey[400]!),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(pr.name),
                  ),
                );
              },
              onTapShowedItem: () {},
              onPickedChange: (items) {},
              onItemAdded: (item) {
                projetosSelecionados.add(item);
              },
              onItemRemoved: (item) {
                projetosSelecionados.remove(item);
              },
              sortShowedItems: true,
              sortPickedItems: true,
              fuzzySearch: FuzzySearch.jaro,
              itemsVisibility: ShowedItemsVisibility.alwaysOn,
              title: Text(
                'Projetos',
                style: kStyleDefault.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              showSelectAllButton: false,
              showClearAllButton: false,
              maximumShowItemsHeight: config.heigth(context, reducao: 500),
              selectAllButton: ElevatedButton(
                onPressed: () {
                  searchController.selectAllItems();
                },
                child: const Text('Todos'),
              ),
              clearAllButton: ElevatedButton(
                onPressed: () {
                  searchController.clearAllPickedItems();
                  searchController.clearSearchField();
                },
                child: const Text('Limpar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
