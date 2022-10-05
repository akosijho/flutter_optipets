import 'package:flutter/material.dart';
import 'package:flutter_optipets/app/app.locator.dart';
import 'package:flutter_optipets/utils/my_colors.dart';
import 'package:flutter_optipets/views/application/application_view_model.dart';
import 'package:flutter_optipets/views/search/search_suggestions.dart';

class SearchViewDelegate extends SearchDelegate {
  final ApplicationViewModel applicationViewModel = locator<ApplicationViewModel>();

  // override appbar theme
  @override
  ThemeData appBarTheme(BuildContext context) {
    return super.appBarTheme(context).copyWith(
          appBarTheme: const AppBarTheme(
            elevation: 1,
            backgroundColor: MyColors.scaffoldBg,
            iconTheme: IconThemeData(
              color: MyColors.black,
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            border: InputBorder.none,
          ),
        );
  }

  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return query.isNotEmpty
        ? [
            IconButton(
              onPressed: () {
                query = '';
              },
              icon: const Icon(Icons.clear),
            ),
          ]
        : null;
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  // executes when pressing return/search keyboard key
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in applicationViewModel.searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    if (matchQuery.isNotEmpty) {
      return SearchSuggestions(query: query, matchQuery: matchQuery);
    } else {
      return const Center(
          child: Text(
        "Nothing found",
        style: TextStyle(
          color: MyColors.black,
        ),
      ));
    }
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in applicationViewModel.searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return SearchSuggestions(query: query, matchQuery: matchQuery);
  }
}
