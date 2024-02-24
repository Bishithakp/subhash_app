import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subhash_app/view_model/stationery_controller.dart';

import '../widget/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StationeryController>(
      builder: (_, mod, __) {
        return SafeArea(
            child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Subash Stationary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      headings(heading: 'Particulars'),
                      headings(heading: 'Inventory'),
                    ]),
                stationeryDetails(mod,
                    label: 'Pen',
                    selectedValue: mod.selectedPen, onChanged: (val) {
                  mod.setpenValue(val);
                }, context: context),
                stationeryDetails(mod,
                    label: 'Pencil',
                    selectedValue: mod.selectedPencil, onChanged: (val) {
                  mod.setpencilValue(val);
                }, context: context),
                stationeryDetails(mod,
                    label: 'Book',
                    selectedValue: mod.selectedbook, onChanged: (val) {
                  mod.setbookValue(val);
                }, context: context),
                CustomButton(
                  label: 'Log Out',
                  onTap: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        ));
      },
    );
  }

  Row stationeryDetails(StationeryController mod,
      {required String label,
      required String selectedValue,
      required BuildContext context,
      required Function onChanged}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Text(
            label,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        //
        DropdownButton<String>(
            value: selectedValue,
            items: mod.types.map((element) {
              return DropdownMenuItem<String>(
                value: element['id'],
                child: Text(
                  element['label'] ?? "",
                  style: TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            onChanged: (va) {
              onChanged(va ?? "");
            })
      ],
    );
  }

  Text headings({required String heading}) {
    return Text(
      heading,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
