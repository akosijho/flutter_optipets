import 'package:flutter/material.dart';

class DewormTab extends StatelessWidget {
   DewormTab({super.key});

  final TextStyle style =  TextStyle(
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
            children: [
              Expanded(
                child: Text(
                  'DATE',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: style,
                ),
              ),
              Expanded(
                child: Text('DEWORMER',
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
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Text('09/21/2021',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.clip,
                                style: style),
                          ),
                          Expanded(
                            child: Text('Nematocide\nPyrantel Embonate Suspension',
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
