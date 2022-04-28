part of 'pages.dart';

class StartingPage extends StatefulWidget {
  final Function? onBackButtonPress;

  const StartingPage({Key? key, this.onBackButtonPress}) : super(key: key);

  @override
  _StartingPageState createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  int selectedQuantity = 1;
  final NowPlayingBloc _nowPlayingBloc = NowPlayingBloc();

  @override
  void initState() {
    _nowPlayingBloc.add(NowPlayingFetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: mainColor,
          ),

          // bg
          SafeArea(
            child: Container(
              color: mainColor,
            ),
          ),

          // Current Movie
          // Container(
          //   margin: const EdgeInsets.all(0),
          //   padding: const EdgeInsets.all(0),
          //   width: double.infinity,
          //   height: 300,
          //   decoration: const BoxDecoration(
          //     image: DecorationImage(
          //       image: NetworkImage(
          //           "https://images.pexels.com/photos/1095550/pexels-photo-1095550.jpeg?cs=srgb&dl=pexels-daria-shevtsova-1095550.jpg&fm=jpg"),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          BlocBuilder<NowPlayingBloc, NowPlayingState>(
            bloc: _nowPlayingBloc,
            builder: (context, state) {
              if (state is NowPlayingError) {
                return Container(
                  margin: const EdgeInsets.all(0),
                  padding: const EdgeInsets.all(0),
                  width: double.infinity,
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://images.pexels.com/photos/1095550/pexels-photo-1095550.jpeg?cs=srgb&dl=pexels-daria-shevtsova-1095550.jpg&fm=jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }
              if (state is NowPlayingInitial || state is NowPlayingLoading) {
                return Shimmer(
                  gradient: const LinearGradient(colors: [
                    Colors.grey,
                    Colors.white,
                    Colors.grey,
                  ]),
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://images.pexels.com/photos/1095550/pexels-photo-1095550.jpeg?cs=srgb&dl=pexels-daria-shevtsova-1095550.jpg&fm=jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }

              if (state is NowPlayingLoaded) {
                return CarouselWithIndicatorDemo(
                    nowPlaying: state.nowPlaying.results!
                        .where((movie) =>
                            movie.id == state.nowPlaying.results![0].id)
                        .toList());
              }

              return Container();
            },
          ),

          // content
          ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // onback Button
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {},
                      child: true
                          ? Container(
                              margin:
                                  const EdgeInsets.only(left: defaultMargin),
                              width: 32,
                              height: 32,
                              decoration: const BoxDecoration(
                                // image
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://user-images.githubusercontent.com/35651583/165598981-ea9a27f8-a507-4b92-b4aa-1748a2cd80c4.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : Container(
                              margin: const EdgeInsets.only(
                                top: defaultMargin,
                                left: defaultMargin,
                              ),
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.black12,
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: mainColor,
                              )),
                            ),
                    ),
                  ),

                  // title
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(height: defaultMargin * 2),
                      // bagdes
                      const Badge(text: "Fantasy"),

                      // movie title
                      Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                          left: defaultMargin,
                          right: defaultMargin,
                        ),
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: BlocBuilder<NowPlayingBloc, NowPlayingState>(
                          builder: (context, state) {
                            if (state is NowPlayingLoaded) {
                              return Text(
                                "${state.nowPlaying.results![0].title}",
                                textAlign: TextAlign.start,
                                style: whiteFontStyle.copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              );
                            }
                            if (state is NowPlayingInitial ||
                                state is NowPlayingLoading) {
                              return Text(
                                "Loading...",
                                textAlign: TextAlign.start,
                                style: whiteFontStyle.copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              );
                            }
                            if (state is NowPlayingError) {
                              return Text(
                                "Error",
                                textAlign: TextAlign.start,
                                style: whiteFontStyle.copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              );
                            }

                            return Container();
                          },
                        ),
                      ),

                      // button watch now
                      BlocBuilder<NowPlayingBloc, NowPlayingState>(
                        builder: (context, state) {
                          if (state is NowPlayingLoaded) {
                            return buttonWatchNow(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MovieDetailPage(
                                      movie: state.nowPlaying.results![0],
                                    ),
                                  ),
                                );
                              },
                            );
                          } else {
                            return buttonWatchNow();
                          }
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: defaultMargin * 2),

                  // movie list new release
                  BlocBuilder<NowPlayingBloc, NowPlayingState>(
                    bloc: _nowPlayingBloc,
                    builder: (context, state) {
                      if (state is NowPlayingLoaded) {
                        return MovieListSection(
                          movies: state.nowPlaying.results!,
                          sectionTitle: 'New Release',
                          isLoading: false,
                        );
                      }

                      if (state is NowPlayingInitial ||
                          state is NowPlayingLoading) {
                        return const MovieListSection(
                          sectionTitle: 'New Release',
                          isLoading: true,
                        );
                      }

                      if (state is NowPlayingError) {
                        return const MovieListSection(
                          sectionTitle: 'New Release',
                          isLoading: false,
                        );
                      }
                      return Container();
                    },
                  ),

                  // movie list  TV Show
                  BlocBuilder<NowPlayingBloc, NowPlayingState>(
                    builder: (context, state) {
                      if (state is NowPlayingLoaded) {
                        return MovieListSection(
                          movies: state.nowPlaying.results!
                              .where((movie) =>
                                  movie.id != state.nowPlaying.results![0].id)
                              .toList(),
                          sectionTitle: 'TV Show',
                          isLoading: false,
                        );
                      }

                      if (state is NowPlayingInitial ||
                          state is NowPlayingLoading) {
                        return const MovieListSection(
                          sectionTitle: 'TV Show',
                          isLoading: true,
                        );
                      }

                      if (state is NowPlayingError) {
                        return const MovieListSection(
                          sectionTitle: 'TV Show',
                          isLoading: false,
                        );
                      }
                      return Container();
                    },
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Padding buttonWatchNow({Function? onTap}) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 10, horizontal: defaultMargin),
      child: ElevatedButton(
          onPressed: () {
            onTap == null ? print("") : onTap();
          },
          child: Text(
            "Watch Now",
            style: yellowAccentFontStyle,
          ),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: accentColor1))))),
    );
  }

  @override
  void dispose() {
    _nowPlayingBloc.close();
    super.dispose();
  }
}
