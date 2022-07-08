import 'package:flutter/material.dart';
import 'package:flutter_application/models/movies.dart';
import 'package:flutter_application/res/color.dart';
import 'package:flutter_application/res/componenets/red_button.dart';
import 'package:flutter_application/res/componenets/white_border_button.dart';
import 'package:flutter_application/res/style/text_style.dart';

class PopularItem extends StatelessWidget {
  final Results movies;
  const PopularItem({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height;
    final width =
        MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Stack(
            alignment: Alignment.bottomLeft,
            children: [
              movies.posterPath == null
                  ? Text("N/A")
                  : _moviePoster(height, width),
              _movieDetail(width, height),
            ]),
      ],
    );
  }

  Padding _movieDetail(
      double width, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 20.0, horizontal: 20.0),
      child: Container(
        alignment: Alignment.centerLeft,
        width: width * .7,
        child: Column(
            mainAxisAlignment:
                MainAxisAlignment.start,
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              movies.title == null
                  ? Text("N/A")
                  : _movieTitle(),
              SizedBox(
                height: height * .02,
              ),
              Row(
                  mainAxisAlignment:
                      MainAxisAlignment.start,
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    RedButton(
                        width: width,
                        height: height),
                    SizedBox(
                      width: width * .05,
                    ),
                    WhiteBorderButton(
                        width: width,
                        height: height),
                  ])
            ]),
      ),
    );
  }

  Text _movieTitle() {
    return Text(movies.title.toString(),
        style: AppStyle.instance.h5Bold.copyWith(
          color: AppColors.whiteColor,
        ));
  }

  Container _moviePoster(
      double height, double width) {
    return Container(
      height: height * .45,
      width: width,
      decoration: BoxDecoration(
          image: DecorationImage(
              filterQuality: FilterQuality.low,
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://image.tmdb.org/t/p/w500${movies.posterPath}"))),
    );
  }
}
