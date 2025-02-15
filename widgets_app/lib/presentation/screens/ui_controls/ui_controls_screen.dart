import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = "ui_controls_screen";
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UI Controls"),
      ),
      body: const _UIControlsView(),
    );
  }
}

class _UIControlsView extends StatefulWidget {
  const _UIControlsView();

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UIControlsViewState extends State<_UIControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text("Developer Mode"),
          subtitle: const Text("Controles adicionales"),
          value: isDeveloper,
          onChanged: (value) {
            setState(() {
              isDeveloper = !isDeveloper;
            });
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Developer mode: ${isDeveloper ? "ON" : "OFF"}"),
              duration: const Duration(seconds: 1),
            ));
          },
        ),
        ExpansionTile(
          title: const Text("Vehiculo de tranporte"),
          subtitle: Text("$selectedTransportation"),
          initiallyExpanded: false,
          children: [
            RadioListTile(
                title: const Text("By car"),
                subtitle: const Text("Viajar en coche"),
                value: Transportation.car,
                groupValue: selectedTransportation,
                onChanged: (value) {
                  setState(() {
                    selectedTransportation = Transportation.car;
                  });
                }),
            RadioListTile(
                title: const Text("By plane"),
                subtitle: const Text("Viajar en avion"),
                value: Transportation.plane,
                groupValue: selectedTransportation,
                onChanged: (value) {
                  setState(() {
                    selectedTransportation = Transportation.plane;
                  });
                }),
            RadioListTile(
                title: const Text("By boat"),
                subtitle: const Text("Viajar en barco"),
                value: Transportation.boat,
                groupValue: selectedTransportation,
                onChanged: (value) {
                  setState(() {
                    selectedTransportation = Transportation.boat;
                  });
                }),
            RadioListTile(
                title: const Text("By submarine"),
                subtitle: const Text("Viajar en submarino"),
                value: Transportation.submarine,
                groupValue: selectedTransportation,
                onChanged: (value) {
                  setState(() {
                    selectedTransportation = Transportation.submarine;
                  });
                }),
          ],
        ),
        CheckboxListTile(
            title: const Text("¿Desayuno?"),
            value: wantsBreakfast,
            onChanged: (value) => setState(() {
                  wantsBreakfast = !wantsBreakfast;
                })),
        CheckboxListTile(
            title: const Text("Almuerzo?"),
            value: wantsLunch,
            onChanged: (value) => setState(() {
                  wantsLunch = !wantsLunch;
                })),
        CheckboxListTile(
            title: const Text("Cena?"),
            value: wantsDinner,
            onChanged: (value) => setState(() {
                  wantsDinner = !wantsDinner;
                })),
      ],
    );
  }
}
