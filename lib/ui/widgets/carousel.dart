part of 'widgets.dart';

final List<String> imgList = [
  'https://images.pexels.com/photos/7809122/pexels-photo-7809122.jpeg?cs=srgb&dl=pexels-erik-mclean-7809122.jpg&fm=jpg',
  'https://images.pexels.com/photos/2854693/pexels-photo-2854693.jpeg?cs=srgb&dl=pexels-josh-hild-2854693.jpg&fm=jpg',
  'https://images.pexels.com/photos/5795430/pexels-photo-5795430.jpeg?cs=srgb&dl=pexels-erik-mclean-5795430.jpg&fm=jpg',
  'https://images.pexels.com/photos/3251664/pexels-photo-3251664.jpeg?cs=srgb&dl=pexels-christian-diokno-3251664.jpg&fm=jpg',
  'https://images.pexels.com/photos/1095550/pexels-photo-1095550.jpeg?cs=srgb&dl=pexels-daria-shevtsova-1095550.jpg&fm=jpg',
];

final List<Widget> imageSliders = imgList
    .map(
      (item) => Container(
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.all(0),
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(item),
            fit: BoxFit.cover,
          ),
        ),
      ),
    )
    .toList();

class CarouselWithIndicatorDemo extends StatefulWidget {
  final List<Movie> nowPlaying;

  const CarouselWithIndicatorDemo({Key? key, required this.nowPlaying})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<Widget> _slides = [];

  @override
  void initState() {
    _prepareImage();
    super.initState();
  }

  _prepareImage() {
    List<String> _imgList = [];
    for (var i = 0; i < widget.nowPlaying.length; i++) {
      _imgList.add(
          "https://image.tmdb.org/t/p/w500" + widget.nowPlaying[i].posterPath!);
    }
    if (_imgList.length == 1) {
      _imgList = _imgList + _imgList + _imgList;
    }

    _prepaceSlides(_imgList);
  }

  _prepaceSlides(List<String> url) {
    for (var i = 0; i < (url.length > 5 ? 5 : url.length); i++) {
      _slides.add(
        Container(
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.all(0),
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(.6), BlendMode.dstATop),
              image: NetworkImage(url[i]),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black26,
      ),
      child: Stack(children: [
        CarouselSlider(
          items: _slides.isNotEmpty ? _slides : imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
              height: 300,
              viewportFraction: 1,
              autoPlay: true,
              enlargeCenterPage: false,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Positioned(
          bottom: 0,
          left: 0.0,
          right: 0.0,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: defaultMargin * 1.2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _slides.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white.withOpacity(0.5)
                                : Colors.white)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ]),
    );
  }
}
