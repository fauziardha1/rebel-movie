part of "widgets.dart";

class MovieCard extends StatelessWidget {
  final Movie? movie;
  const MovieCard({
    Key? key,
    this.movie = null,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => MovieDetailPage(
              movie: movie,
            ),
          ),
        );
      },
      child: Container(
        width: 160,
        height: 220,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.4),
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: NetworkImage(
                "https://image.tmdb.org/t/p/w500" + movie!.posterPath!),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Badge(text: "Fantasy"),

            // star rating
            Container(
              margin: const EdgeInsets.only(
                top: defaultMargin / 3,
                left: defaultMargin,
              ),
              child: Row(
                children: [
                  for (var item in [1, 2, 3, 4, 5])
                    const Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 12,
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: defaultMargin / 3,
                  left: defaultMargin,
                  right: defaultMargin,
                  bottom: defaultMargin),
              child: Text(
                movie?.title ?? "Movie Title",
                style: whiteFontStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
