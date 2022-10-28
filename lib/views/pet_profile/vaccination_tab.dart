import 'package:flutter/material.dart';

class VaccinationTab extends StatelessWidget{
  VaccinationTab({super.key});

   final TextStyle style =  TextStyle(
    fontSize: 12,
    color: Colors.grey.shade600);
  final TextStyle headerStyle =  TextStyle(
    fontSize: 16,
    color: Colors.grey.shade700);
  
  @override
  Widget build(BuildContext context) {
   return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                child: Text(
                  'DATE',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: style,
                ),
              ),
              Expanded(
                child: Text('VACCINE',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    style: style),
              ),
              Expanded(
                child: Text('VET',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    style: style),
              ),
            ],
          ),
          ListView.separated(
              primary: false,
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(
                    height: 16,
                  ),
              padding: const EdgeInsets.fromLTRB(4, 8, 4, 4),
              itemCount: 20,
              itemBuilder: (context, index) => Column(
                mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 80,
                            child: Text('09/21/2021',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.clip,
                                style: style),
                          ),
                          Expanded(
                            child: Text('Quantom Dog 5 n\'1',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.clip,
                                style: style),
                          ),
                          Expanded(
                            child: Text('FLOREMAY L. LUDEVESE, DVM\nPRC NO: 8807',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.clip,
                                style: style),
                          ),
                        ],
                      ),
                    ],
                  )),
        ],
      ),
    );
  }

}