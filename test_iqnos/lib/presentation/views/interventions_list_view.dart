import 'package:flutter/material.dart';
import 'package:test_iqnos/config/domain/model/intervention.dart';

class InterventionsListView extends StatelessWidget {
  const InterventionsListView({super.key});

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: double.infinity,
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(),
            SizedBox(height: 20,),
            Text("FINALIZADAS", style: textTheme.titleLarge,),
            Expanded(child: _ListView())
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.sizeOf(context).width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: _IntervenctionCardView(
          intervention: fakeInterventions[0],
        ),
        ),
        SizedBox(width: 10,),
        Expanded(
          child: _IntervenctionCardView(
          intervention: fakeInterventions[1],
        ),
        )
      ]);
  }
}


class _ListView extends StatelessWidget {
  const _ListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisExtent: 170, crossAxisCount: 2, crossAxisSpacing: 10),
        itemCount: fakeInterventions.length,
        itemBuilder: (context, index) {
          return GridTile(child: _IntervenctionCardView(intervention: fakeInterventions[index]));
            
        },),
    );
  }
}

class _IntervenctionCardView extends StatelessWidget {
  final Intervention intervention;
  const _IntervenctionCardView({required this.intervention});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 2, color: Colors.black), 
        borderRadius: BorderRadius.circular(10)
      ),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(intervention.name),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(intervention.vechicleID)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(intervention.deviceID)
              ],
            ),
            Divider(),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(intervention.company, overflow: TextOverflow.ellipsis,)),
                Text(intervention.type, overflow: TextOverflow.ellipsis)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(intervention.technician, overflow: TextOverflow.ellipsis,)),
                Text(intervention.date, overflow: TextOverflow.ellipsis)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
