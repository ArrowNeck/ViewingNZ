import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/services/routes.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/utils/image_preloader.dart';
import 'package:viewing_nz/core/widgets/cached_image.dart';

class ImageListView extends StatefulWidget {
  const ImageListView({
    super.key,
    required this.refId,
    required this.images,
    this.initialIndex = 0,
  });

  final int refId;
  final List<String> images;
  final int initialIndex;

  @override
  State<ImageListView> createState() => _ImageListViewState();
}

class _ImageListViewState extends State<ImageListView> {
  final ItemScrollController _itemScrollController = ItemScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ImagePreloader.preloadImages(widget.images, context);
      Future.microtask(() => scrollTo(widget.initialIndex));
    });
  }

  void scrollTo(int index) => _itemScrollController.scrollTo(
    index: index,
    duration: Duration(milliseconds: 1000),
    alignment: .3,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pureBlack,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.pureBlack.withAlpha(128),
        foregroundColor: AppColors.white,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ref ID: #${widget.refId}",
              style: context.bodyMedium.copyWith(color: AppColors.white),
            ),
            Text(
              "${widget.images.length} Photos",
              style: context.bodySmall.copyWith(color: AppColors.white),
            ),
          ],
        ),
      ),
      body: ScrollablePositionedList.builder(
        itemScrollController: _itemScrollController,
        itemCount: widget.images.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: GestureDetector(
              onTap: () =>
                  context.push(Routes.imageFullScreen(index, widget.images)),
              child: Hero(
                tag: 'list_image_$index',
                // transitionOnUserGestures: true,
                child: AspectRatio(
                  aspectRatio: 1.5,
                  child: CachedImage(url: widget.images[index]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
