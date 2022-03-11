import 'package:flutter/material.dart';
import 'package:flutter_movie_app/modules/search/components/search_item_view.dart';
import 'package:flutter_movie_app/router_name.dart';
import 'package:flutter_movie_app/utils/k_colors.dart';
import 'package:flutter_movie_app/widgets/custom_search_field.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0.0,
        toolbarHeight: kToolbarHeight + 20,
        title: CustomSearchField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Type Something';
            }
            return null;
          },
          onCloseTap: () {
            Navigator.pushNamed(context, Routes.searchResult);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Text(
              'Top Results',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
            const SizedBox(height: 10),
            const Divider(
              thickness: 1,
              color: Colors.black12,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.watchDetails);
                    },
                    child: const SearchItemView(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
