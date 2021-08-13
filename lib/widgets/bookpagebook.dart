// import 'package:core/core.dart';
import 'package:flutter/material.dart';
// import 'package:inkino/assets.dart';
// import 'package:inkino/ui/common/widget_utils.dart';
import 'package:meta/meta.dart';
// import 'package:url_launcher/url_launcher.dart';

@visibleForTesting
// Function(String) launchTrailerVideo = (url) async {
//   if (await canLaunch(url)) {
//     await launch(url);
//   }
// };

class EventPoster extends StatelessWidget {
  static const Key playButtonKey = Key('playButton');

  // ignore: use_key_in_widget_constructors
  const EventPoster({
    @required 
    // this.event,
    this.size,
    this.displayPlayButton = false,
  });

  // final Event event;
  final Size size;
  final bool displayPlayButton;

  // ignore: unused_element
  Widget _buildPlayButton() =>
      // displayPlayButton && event.youtubeTrailers.isNotEmpty()
      //     ? 
          _PlayButton();
          // : null;

  // ignore: unused_element
  Widget _buildPosterImage() => 
  // event.images.portraitMedium != null ? 
      FadeInImage.assetNetwork(
          placeholder: "https://www.creativindiecovers.com/wp-content/gallery/portfolio/fateweb.jpg",
          image: "https://www.creativindiecovers.com/wp-content/gallery/portfolio/greenweb.jpg",
          width: size?.width,
          height: size?.height,
          fadeInDuration: const Duration(milliseconds: 300),
          fit: BoxFit.cover,
        );
      // : null;

  @override
  Widget build(BuildContext context) {
    final content = <Widget>[
      const Icon(
        Icons.book,
        color: Colors.white24,
        size: 72.0,
      ),
    ];

    // addIfNonNull(_buildPosterImage(), content);
    // addIfNonNull(_buildPlayButton(), content);

    return Container(
      decoration: _buildDecorations(),
      width: size?.width,
      height: size?.height,
      child: Stack(
        alignment: Alignment.center,
        children: content,
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {                 //defining properties of play button on the image
  // _PlayButton(this.event);
  // final Event event;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black38,
      ),
      child: Material(
        type: MaterialType.circle,
        color: Colors.transparent,
        child: IconButton(
          key: EventPoster.playButtonKey,
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.play_circle_outline),           // icon on the pic on event page
          iconSize: 42.0,
          color: Colors.white.withOpacity(0.8),
          onPressed: () {
            debugPrint("add");
            // final url = event.youtubeTrailers.first();
            // launchTrailerVideo(url);
          },
        ),
      ),
    );
  }
}

BoxDecoration _buildDecorations() {
  return const BoxDecoration(
    boxShadow: [
      BoxShadow(
        offset: Offset(1.0, 1.0),
        spreadRadius: 1.0,
        blurRadius: 2.0,
        color: Colors.black38,
      ),
    ],
    gradient: LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [
        Color(0xFF222222),
        Color(0xFF424242),
      ],
    ),
  );
}
