part of 'pages.dart';

class MovieDetailPage extends StatefulWidget {
  // final Transaction transaction;
  final Function? onBackButtonPress;
  final Movie? movie;

  const MovieDetailPage({Key? key, this.onBackButtonPress, this.movie})
      : super(key: key);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final SimilarBloc _similarBloc = SimilarBloc();
  int selectedQuantity = 1;

  @override
  void initState() {
    // TODO: implement initState
    _similarBloc.add(
        GetSimilarEvent(movieId: widget.movie == null ? 1 : widget.movie!.id!));
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
          Container(
            margin: const EdgeInsets.all(0),
            padding: const EdgeInsets.all(0),
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(.6), BlendMode.dstATop),
                image: NetworkImage(widget.movie != null
                    ? "https://image.tmdb.org/t/p/w500" +
                        widget.movie!.posterPath.toString()
                    : "https://images.pexels.com/photos/1095550/pexels-photo-1095550.jpeg?cs=srgb&dl=pexels-daria-shevtsova-1095550.jpg&fm=jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // CarouselWithIndicatorDemo(),

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
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: defaultMargin,
                          left: defaultMargin,
                        ),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black.withOpacity(0.4),
                        ),
                        child: const Center(
                            child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                        )),
                      ),
                    ),
                  ),

                  // title
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(height: defaultMargin * 2),
                      // bagdes
                      const Badge(text: "Fantasy"),

                      Padding(
                        padding: const EdgeInsets.only(
                          top: defaultMargin / 3,
                          left: defaultMargin,
                          bottom: defaultMargin / 3,
                        ),
                        child: Row(
                          children: [
                            for (var i = 0; i < 5; i++)
                              const Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 10,
                              ),
                            const SizedBox(
                              width: 2,
                            ),
                            const Icon(Icons.circle,
                                color: Colors.white, size: defaultMargin / 3),
                            const SizedBox(width: defaultMargin / 2),
                            Text("Release Year: 2020",
                                style: greyFontStyle.copyWith(
                                    fontSize: 10,
                                    fontWeight: FontWeight.normal)),
                          ],
                        ),
                      ),

                      // movie title
                      Container(
                        margin: const EdgeInsets.only(
                          top: defaultMargin / 3,
                          left: defaultMargin,
                          right: defaultMargin,
                        ),
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          widget.movie != null
                              ? widget.movie!.title.toString()
                              : "Movie Title",
                          textAlign: TextAlign.start,
                          style: whiteFontStyle.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      SizedBox(height: defaultMargin * 4),

                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            vertical: 8, horizontal: defaultMargin),
                        decoration: BoxDecoration(
                          color: mainColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: defaultMargin),
                              child: Text("Synopsis",
                                  style: whiteFontStyle.copyWith(fontSize: 20)),
                            ),
                            const SizedBox(height: defaultMargin),
                            Container(
                              padding: EdgeInsets.all(defaultMargin),
                              decoration: BoxDecoration(
                                color: Color(0xff242424),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                widget.movie != null
                                    ? widget.movie!.overview.toString()
                                    : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                style: greyFontStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            const SizedBox(height: defaultMargin / 2),
                            Row(
                              children: [
                                Text("Cast: ",
                                    style: whiteFontStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w200)),
                                Text("Gal Gadot, Kristen Wiig, Tom Hardy,",
                                    style: whiteFontStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                                TextButton(
                                    onPressed: () {}, child: Text("more")),
                              ],
                            ),

                            // new section
                            Divider(
                              color: Colors.white.withOpacity(.1),
                              thickness: 1,
                            ),

                            // section episode
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: defaultMargin),
                              child: Text("Episodes",
                                  style: whiteFontStyle.copyWith(fontSize: 20)),
                            ),
                            const SizedBox(height: defaultMargin),

                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: AspectRatio(
                                    aspectRatio: 3 / 2,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                            image: NetworkImage(widget.movie !=
                                                    null
                                                ? "https://image.tmdb.org/t/p/w500" +
                                                    widget.movie!.posterPath
                                                        .toString()
                                                : "https://images.pexels.com/photos/1095550/pexels-photo-1095550.jpeg?cs=srgb&dl=pexels-daria-shevtsova-1095550.jpg&fm=jpg"),
                                            fit: BoxFit.cover),
                                      ),
                                      // video play icon
                                      child: IconButton(
                                        icon: Container(
                                          decoration: BoxDecoration(
                                            color: const Color(0xff1D1D1D)
                                                .withOpacity(.7),
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                            Icons.play_arrow_rounded,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      left: defaultMargin,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "1 - " +
                                                (widget.movie != null
                                                    ? widget.movie!.title
                                                        .toString()
                                                    : "Episode Title"),
                                            style: whiteFontStyle.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold)),
                                        const SizedBox(
                                            height: defaultMargin / 3),
                                        Text("2h 30m",
                                            style: whiteFontStyle.copyWith(
                                                color: Colors.white
                                                    .withOpacity(.4),
                                                fontSize: 10,
                                                fontWeight: FontWeight.w200)),
                                        const SizedBox(
                                            height: defaultMargin / 3),
                                        Text(
                                            widget.movie != null
                                                ? widget.movie!.overview
                                                        .toString()
                                                        .substring(0, 75) +
                                                    "..."
                                                : "Episode Description",
                                            overflow: TextOverflow.fade,
                                            style: whiteFontStyle.copyWith(
                                                color: Colors.white
                                                    .withOpacity(.4),
                                                fontSize: 10,
                                                fontWeight: FontWeight.w200)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: defaultMargin),
                            Divider(
                              color: Colors.white.withOpacity(.1),
                              thickness: 1,
                            ),

                            // section similar
                            Container(
                              color: Colors.blue,
                              transform: Matrix4.translationValues(
                                  -defaultMargin, 0.0, 0.0),
                              child: BlocBuilder<SimilarBloc, SimilarState>(
                                bloc: _similarBloc,
                                builder: (context, state) {
                                  if (state is SimilarLoaded) {
                                    return MovieListSection(
                                      movies: state.similar.results!,
                                      sectionTitle: 'You Might Also Like This',
                                      isLoading: false,
                                    );
                                  }

                                  if (state is SimilarInitial ||
                                      state is SimilarLoading) {
                                    return const MovieListSection(
                                      sectionTitle: 'You Might Also Like This',
                                      isLoading: true,
                                    );
                                  }

                                  if (state is SimilarError) {
                                    return const MovieListSection(
                                      sectionTitle: 'You Might Also Like This',
                                      isLoading: false,
                                    );
                                  }
                                  return Container();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
