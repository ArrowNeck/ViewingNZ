import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_router/go_router.dart';
import 'package:viewing_nz/core/services/routes.dart';
import 'package:viewing_nz/core/widgets/cached_image.dart';
import 'package:viewing_nz/core/widgets/doted_carousel_indicator.dart';

class PropertyPoster extends StatefulWidget {
  const PropertyPoster({super.key});

  @override
  State<PropertyPoster> createState() => _ViewingPosterState();
}

class _ViewingPosterState extends State<PropertyPoster> {
  final CarouselSliderController _controller = CarouselSliderController();
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  final List<String> samplePropertyImages = [
    "https://images.pexels.com/photos/280222/pexels-photo-280222.jpeg",
    "https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg",
    "https://images.pexels.com/photos/1396122/pexels-photo-1396122.jpeg",
    "https://images.pexels.com/photos/1029599/pexels-photo-1029599.jpeg",
    "https://images.pexels.com/photos/259588/pexels-photo-259588.jpeg",
  ];

  @override
  void dispose() {
    _currentIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: GestureDetector(
        onTap: () => context.push(
          Routes.imageListView(2345, _currentIndex.value, samplePropertyImages),
        ),
        child: Stack(
          children: [
            CarouselSlider.builder(
              carouselController: _controller,
              itemCount: samplePropertyImages.length,
              itemBuilder: (context, index, realIndex) {
                return CachedImage(url: samplePropertyImages[index]);
              },
              options: CarouselOptions(
                aspectRatio: 8 / 7,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                enlargeCenterPage: false,
                autoPlay: false,
                onPageChanged: (index, reason) {
                  _currentIndex.value = index;
                },
              ),
            ),
            Positioned.fill(
              bottom: 16,
              child: ValueListenableBuilder(
                valueListenable: _currentIndex,
                builder: (context, value, child) {
                  return DottedCarouselIndicator(
                    itemCount: samplePropertyImages.length,
                    currentIndex: value,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
