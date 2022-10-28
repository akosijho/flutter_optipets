import 'package:flutter/material.dart';

class DewormTab extends StatelessWidget {
   DewormTab({super.key});

  final TextStyle style =  TextStyle(
    fontSize: 12,
    color: Colors.grey.shade600);
  final TextStyle headerStyle =  TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Colors.grey.shade700);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 80,
              child: Text(
                'DATE',
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                style: headerStyle,
              ),
            ),
            Expanded(
              child: Text('DEWORMER',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: headerStyle),
            ),
            Expanded(
              child: Text('VET',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: headerStyle),
            ),
          ],
        ),
        Flexible(
          child: ListView.separated(
              primary: false,
              scrollDirection: Axis.vertical,
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
        ),
      ],
    );
  }
}
