import 'package:flutter/material.dart';
import 'package:flutter_movie_app/modules/home/components/watch_view_item.dart';
import 'package:flutter_movie_app/utils/k_colors.dart';
import 'package:flutter_movie_app/utils/k_images.dart';
import 'package:flutter_movie_app/utils/k_strings.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        toolbarHeight: kToolbarHeight + 20,
        title: TextFormField(
          textInputAction: TextInputAction.search,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  Kimage.closeIcon2,
                  color: textColor,
                  height: 15,
                  width: 15,
                ),
              ),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(16),
              child: SvgPicture.asset(
                Kimage.searchIcon,
                color: textColor,
                height: 15,
                width: 15,
              ),
            ),
            hintText: KString.searchHint,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                MediaQuery.of(context).orientation == Orientation.landscape
                    ? 4
                    : 2,
            mainAxisExtent: 100,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (BuildContext context, int index) {
            return const WatchViewItem();
          },
        ),
      ),
    );
  }
}
