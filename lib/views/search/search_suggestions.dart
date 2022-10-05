import 'package:flutter/material.dart';
import 'package:flutter_optipets/utils/my_colors.dart';
import 'package:flutter_optipets/utils/svg_images.dart';
import 'package:flutter_optipets/views/pets_screen/pet_item.dart';

class SearchSuggestions extends StatelessWidget {
  const SearchSuggestions(
      {Key? key, required this.query, required this.matchQuery})
      : super(key: key);

  final String query;
  final List<String> matchQuery;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              scrollDirection: Axis.vertical,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   query.isEmpty
                    ? Text(
                      "Suggestions",
                      style: TextStyle(
                        color: MyColors.black.withOpacity(0.6),
                      ),
                    ) : Container(),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.only(top: 8),
                      shrinkWrap: true,
                      primary: false,
                      itemCount: matchQuery.length,
                      itemBuilder: (context, index) {
                        var result = matchQuery[index];
                        return PetItem(
                          showActions: false,
                          name: result,
                          breed: result,
                          image: SvgImages.temp,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
