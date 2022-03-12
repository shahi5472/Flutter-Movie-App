import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/controllers/watch/watch_details_controller.dart';
import 'package:flutter_movie_app/data/movie_db_response_model.dart';
import 'package:flutter_movie_app/router_name.dart';
import 'package:flutter_movie_app/utils/k_colors.dart';
import 'package:flutter_movie_app/utils/rest_api.dart';
import 'package:flutter_movie_app/utils/utils.dart';
import 'package:flutter_movie_app/widgets/custom_image_view.dart';
import 'package:flutter_movie_app/widgets/error_view.dart';
import 'package:flutter_movie_app/widgets/loading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WatchDetailsScreen extends StatefulWidget {
  const WatchDetailsScreen({Key? key}) : super(key: key);

  @override
  State<WatchDetailsScreen> createState() => _WatchDetailsScreenState();
}

class _WatchDetailsScreenState extends State<WatchDetailsScreen> {
  late dynamic arguments = ModalRoute.of(context)!.settings.arguments;

  late WatchDetailsController _controller;

  late Result _result;

  final CarouselOptions options = CarouselOptions(
    height: double.infinity,
    viewportFraction: 1,
    enableInfiniteScroll: true,
    autoPlay: true,
    autoPlayInterval: const Duration(seconds: 3),
    autoPlayAnimationDuration: const Duration(milliseconds: 800),
    autoPlayCurve: Curves.fastOutSlowIn,
    enlargeCenterPage: false,
    scrollDirection: Axis.horizontal,
  );

  @override
  void initState() {
    _controller = Provider.of<WatchDetailsController>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    _controller.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _result = Result.fromJson(arguments['data']);
    _controller.getMovieDetails(arguments['id'] ?? _result.id);
    Size _size = MediaQuery.of(context).size;
    return Consumer<WatchDetailsController>(builder: (context, data, child) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: whiteColor,
        body: data.isDetailsLoading
            ? const Loading()
            : data.errorMessage != null
                ? ErrorView(
                    message: data.errorMessage!,
                    onPressed: () {
                      Utils.showAlertDialog(
                        context,
                        onPressedCancel: () {
                          _controller.clear();
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        onPressedRefresh: () {
                          _controller.clear();
                          Navigator.pop(context);
                          _controller.getMovieDetails(arguments['id']);
                        },
                      );
                    })
                : _view(_size, data),
      );
    });
  }

  Widget _view(_size, data) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios, color: whiteColor),
              ),
              Text(
                _result.title ?? 'Watch',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: whiteColor,
                ),
              ),
            ],
          ),
          expandedHeight: _size.height * 0.6,
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              children: [
                CarouselSlider(
                  items: List.generate(data.backdrops.take(5).length, (index) {
                    return CustomImageView(
                      image: RestApi.getImage(
                        data.backdrops[index].filePath ?? '',
                      ),
                      height: _size.height * 0.6,
                    );
                  }),
                  options: options,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        const Color(0xff000000).withOpacity(0.9),
                        const Color(0xff000000).withOpacity(0.0),
                      ],
                      stops: const [
                        0.0,
                        0.9,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 34,
                  left: 66,
                  right: 66,
                  child: SlideInDown(
                    child: Column(
                      children: [
                        Image.asset('assets/images/king_man_logo.png'),
                        const SizedBox(height: 6),
                        Text(
                          'In theaters ${formatDate(data.model.releaseDate ?? DateTime.now().toString())}',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: whiteColor,
                          ),
                        ),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.selectSeat);
                          },
                          child: Text(
                            'Get Tickets',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: whiteColor,
                            ),
                          ),
                        ),
                        const WatchTrailerButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SlideInUp(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 27),
                  Text(
                    'Genres',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: textColor,
                    ),
                  ),
                  if (data.model.genres != null)
                    Wrap(
                      spacing: 5,
                      children: List.generate(
                        data.model.genres!.take(5).length,
                        (index) => _buildChip(
                          data.model.genres![index].name!,
                          colors[index],
                        ),
                      ),
                    ),
                  const SizedBox(height: 22),
                  const Divider(
                    thickness: 1,
                    color: Colors.black12,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Overview',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    data.model.overview ?? '',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: captionTextColor,
                      height: 1.7,
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChip(String text, Color color) {
    return Chip(
      label: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: whiteColor,
        ),
      ),
      backgroundColor: color,
    );
  }
}

class WatchTrailerButton extends StatelessWidget {
  const WatchTrailerButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: lightBlueColor,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 66,
      ),
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.play_arrow,
            color: whiteColor,
          ),
          const SizedBox(width: 8),
          Text(
            'Watch Trailer',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
