import 'package:flutter/material.dart';
import 'package:flutter_application/data/response/status.dart';
import 'package:flutter_application/res/style/text_style.dart';
import 'package:flutter_application/view/home/up_coming_list/movie_list_item.dart';
import 'package:flutter_application/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

import '../../../res/color.dart';

class UpComingListView extends StatefulWidget {
  UpComingListView({Key? key}) : super(key: key);

  @override
  State<UpComingListView> createState() =>
      _UpComingListViewState();
}

class _UpComingListViewState
    extends State<UpComingListView> {
  HomeViewViewModel homeViewViewModel =
      HomeViewViewModel();

  @override
  void initState() {
    homeViewViewModel.fetchUpComingListApi();
    super.initState();
  }

  @override
  void dispose() {
    homeViewViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 20),
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,
        crossAxisAlignment:
            CrossAxisAlignment.center,
        children: [
          ChangeNotifierProvider<
                  HomeViewViewModel>(
              create: (BuildContext context) =>
                  homeViewViewModel,
              child: Consumer<HomeViewViewModel>(
                  builder: (context, value, _) {
                switch (
                    value.upComingList.status) {
                  case Status.LOADING:
                    return  Container(
                        height: height,
                        child: Center(
                            child:
                                CircularProgressIndicator()),
                      );
                  case Status.ERROR:
                    return Text(value.upComingList
                        .toString());
                  case Status.COMPLETED:
                    return Column(children: [
                      HomeListTittleWidget(
                          text:
                              "Upcoming Film List"),
                      SizedBox(
                        height: height * .02,
                      ),
                      _upComingMovieList(
                          height, value)
                    ]);
                  default:
                    return Text("Hata");
                }
              })),
        ],
      ),
    );
  }

  SizedBox _upComingMovieList(
      double height, HomeViewViewModel value) {
    return SizedBox(
      height: height * .4,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: value
              .upComingList.data!.results!.length,
          itemBuilder: (context, index) {
            return ListItem(
                movies: value.upComingList.data!
                    .results![index]);
          }),
    );
  }
}

class HomeListTittleWidget
    extends StatelessWidget {
  final String text;
  const HomeListTittleWidget(
      {Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: AppStyle.instance.h5Bold,
        ),
        Text("See all",
            style:
                AppStyle.instance.h5Bold.copyWith(
              color: AppColors.redColor,
            )),
      ],
    );
  }
}
