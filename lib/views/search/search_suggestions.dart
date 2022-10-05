import 'package:flutter/material.dart';
import 'package:flutter_optipets/utils/my_colors.dart';

class SearchSuggestions extends StatelessWidget{
  const SearchSuggestions({Key? key, required this.query, required this.matchQuery}) : super(key: key);
  
  final String query;
  final List<String> matchQuery;

  @override
  Widget build(BuildContext context) {
   return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: query.isEmpty
          ? ListView(
              scrollDirection: Axis.vertical,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Suggestions",
                      style: TextStyle(
                        color: MyColors.black.withOpacity(0.6),
                      ),
                    ),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      primary: false,
                      itemCount: matchQuery.length,
                      itemBuilder: (context, index) {
                        var result = matchQuery[index];
                        return ListTile(
                          title: Text(result),
                        );
                      },
                    ),
                  ],
                ),
              ],
            )
          : ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              primary: false,
              itemCount: matchQuery.length,
              itemBuilder: (context, index) {
                var result = matchQuery[index];
                return ListTile(
                  title: Text(result),
                );
              },
            ),
    );
  }

}