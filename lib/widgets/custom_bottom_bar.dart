import 'package:flutter/material.dart';
import 'package:flutter_movie_app/utils/k_colors.dart';
import 'package:flutter_movie_app/utils/k_images.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({
    Key? key,
    required this.currentIndex,
    this.height = 60,
    this.onItemSelected,
  }) : super(key: key);

  final int currentIndex;
  final double height;
  final ValueChanged<int>? onItemSelected;

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      color: primaryColor,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(27),
        topRight: Radius.circular(27),
      ),
      child: SizedBox(
        width: double.infinity,
        height: widget.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildItem(
              onTap: () {
                if (widget.onItemSelected != null) widget.onItemSelected!(0);
                currentIndex = 0;
                setState(() {});
              },
              isSelected: currentIndex == 0,
              text: "Dashboard",
              icon: Kimage.dashboardIcon,
            ),
            _buildItem(
              onTap: () {
                if (widget.onItemSelected != null) widget.onItemSelected!(1);
                currentIndex = 1;
                setState(() {});
              },
              isSelected: currentIndex == 1,
              text: "Watch",
              icon: Kimage.watchIcon,
            ),
            _buildItem(
              onTap: () {
                if (widget.onItemSelected != null) widget.onItemSelected!(2);
                currentIndex = 2;
                setState(() {});
              },
              isSelected: currentIndex == 2,
              text: "Media Library",
              icon: Kimage.mediaLibraryIcon,
            ),
            _buildItem(
              onTap: () {
                if (widget.onItemSelected != null) widget.onItemSelected!(3);
                currentIndex = 3;
                setState(() {});
              },
              isSelected: currentIndex == 3,
              text: "More",
              icon: Kimage.moreIcon,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem({
    required VoidCallback onTap,
    required bool isSelected,
    required String text,
    required String icon,
  }) {
    return Flexible(
      child: InkWell(
        onTap: onTap,
        child: CustomNavItem(
          text: text,
          isSelected: isSelected,
          icon: SvgPicture.asset(
            icon,
            height: 16,
            width: 16,
            color: isSelected ? whiteColor : darkGreyColor,
          ),
        ),
      ),
    );
  }
}

class CustomNavItem extends StatelessWidget {
  const CustomNavItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.isSelected,
  }) : super(key: key);

  final String text;
  final Widget icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Tooltip(
        message: text,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            icon,
            const SizedBox(height: 8),
            Text(
              text,
              style: TextStyle(
                color: isSelected ? whiteColor : darkGreyColor,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
