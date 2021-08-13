import 'dart:ui' as ui;

// import 'package:core/core.dart';
import 'package:movie_moves/widgets/bookpagescrolleffects.dart';
import 'package:flutter/material.dart';
// import 'package:inkino/assets.dart';
// import 'package:inkino/ui/event_details/event_details_scroll_effects.dart';
import 'package:meta/meta.dart';

class EventBackdropPhoto extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const EventBackdropPhoto({
    // @required this.event,
    @required this.scrollEffects,
  });

  // final Event event;
  final EventDetailsScrollEffects scrollEffects;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Stack(
        children: [
          _BackdropPhoto(scrollEffects),
          _BlurOverlay(scrollEffects),
          _InsetShadow(),
        ],
      ),
    );
  }
}

class _BackdropPhoto extends StatelessWidget {
  const _BackdropPhoto(
    // this.event, 
    this.scrollEffects);
  // final Event event;
  final EventDetailsScrollEffects scrollEffects;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _PlaceholderBackground(scrollEffects.backdropHeight),    //background of image in case image doesnt appear
        _BackdropImage(scrollEffects),                   //backdrop image
      ],
    );
  }
}

class _PlaceholderBackground extends StatelessWidget {
  const _PlaceholderBackground(this.height);
  final double height;

  @override
  Widget build(BuildContext context) {
    const decoration =  BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          Color(0xFF222222),
          Color(0xFF424242),
        ],
      ),
    );

    return Container(
      width: MediaQuery.of(context).size.width,
      height: height,
      decoration: decoration,
      child: const Center(
        child: Icon(
          Icons.book,
          color: Colors.white30,
          size: 96.0,
        ),
      ),
    );
  }
}

class _BackdropImage extends StatelessWidget {
  const _BackdropImage(
    // this.event,
     this.scrollEffects);
  // final Event event;
  final EventDetailsScrollEffects scrollEffects;

  String get photoUrl =>
      "https://wallpapercave.com/wp/jiJZXEJ.jpg" ?? "https://wallpapercave.com/wp/jiJZXEJ.jpg";

  @override
  Widget build(BuildContext context) {
    if (photoUrl == null) {
      return const SizedBox.shrink();
    }

    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth,
      height: scrollEffects.backdropHeight,
      child: FadeInImage.assetNetwork(
        fadeInDuration: const Duration(milliseconds: 300),
        placeholder: "https://wallpapercave.com/wp/jiJZXEJ.jpg",
        image: photoUrl,
        width: screenWidth,
        height: scrollEffects.backdropHeight,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _BlurOverlay extends StatelessWidget {
  const _BlurOverlay(this.scrollEffects);
  final EventDetailsScrollEffects scrollEffects;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ui.ImageFilter.blur(
        sigmaX: scrollEffects.backdropOverlayBlur,
        sigmaY: scrollEffects.backdropOverlayBlur,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: scrollEffects.backdropHeight,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(
            scrollEffects.backdropOverlayOpacity * 0.4,
          ),
        ),
      ),
    );
  }
}

class _InsetShadow extends StatelessWidget {            //shadow to make the image merge into the lower part
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Positioned(
      bottom: -8.0,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 5.0,
              spreadRadius: 3.0,
            ),
          ],
        ),
        child: SizedBox(
          width: screenWidth,
          height: 10.0,
        ),
      ),
    );
  }
}
