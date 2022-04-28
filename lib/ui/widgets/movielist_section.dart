part of "widgets.dart";

class MovieListSection extends StatelessWidget {
  final String sectionTitle;
  final bool isLoading;
  final List<Movie> movies;
  const MovieListSection({
    Key? key,
    required this.sectionTitle,
    this.isLoading = true,
    this.movies = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: defaultMargin),
      decoration: BoxDecoration(
        color: mainColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(sectionTitle, style: whiteFontStyle.copyWith(fontSize: 20)),
              InkWell(
                onTap: () {
                  print("See all");
                },
                child: Row(
                  children: [
                    Text("See All ",
                        style: yellowAccentFontStyle.copyWith(fontSize: 14)),
                    Icon(Icons.arrow_forward_ios_rounded,
                        color: accentColor1, size: 14),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultMargin),

          // list of movies cards with image and title
          Container(
              height: 220,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) => isLoading
                    ? Shimmer(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.grey,
                            Colors.white,
                          ],
                        ),
                        child: Container(
                            width: 160,
                            height: 220,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            )),
                      )
                    : MovieCard(
                        movie: movies[index],
                      ),
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: defaultMargin);
                },
                itemCount: movies.length > 7 ? 7 : movies.length,
              )),
        ],
      ),
    );
  }
}
