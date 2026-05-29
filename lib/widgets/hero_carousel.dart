import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:textile_mobile_app/app/firebase_providers.dart';

class HeroCarousel extends ConsumerStatefulWidget {
  const HeroCarousel({super.key, required this.onShopNow});

  final VoidCallback onShopNow;

  @override
  ConsumerState<HeroCarousel> createState() => _HeroCarouselState();
}

class _HeroCarouselState extends ConsumerState<HeroCarousel> {
  final PageController _controller = PageController(viewportFraction: 0.96);
  int _index = 0;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _startTimer(int count) {
    _timer?.cancel();
    if (count <= 1) return;
    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!mounted || count == 0) return;
      final next = (_index + 1) % count;
      _controller.animateToPage(
        next,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final bannersAsync = ref.watch(bannersStreamProvider);
    final banners = bannersAsync.valueOrNull ?? [];
    final active = banners.where((b) => b.isActive).toList();

    if (active.isEmpty) {
      _timer?.cancel();
      _timer = null;
      return const SizedBox(height: 230);
    }

    final imageUrls = active.map((b) => b.imageUrl).toList();
    final titles = active.map((b) => b.title).toList();
    final subtitles = active.map((b) => b.subtitle).toList();

    if (_timer == null) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => _startTimer(imageUrls.length),
      );
    }

    return SizedBox(
      height: 230,
      child: PageView.builder(
        controller: _controller,
        itemCount: imageUrls.length,
        onPageChanged: (value) => setState(() => _index = value),
        itemBuilder: (context, index) {
          final isActive = index == _index;
          return AnimatedScale(
            duration: const Duration(milliseconds: 450),
            scale: isActive ? 1 : 0.96,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 450),
              opacity: isActive ? 1 : 0.75,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                ),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CachedNetworkImage(
                      imageUrl: imageUrls[index],
                      fit: BoxFit.cover,
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.7),
                            Colors.transparent,
                          ],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            titles[index].isNotEmpty
                                ? titles[index]
                                : 'Style Redefined',
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            subtitles[index].isNotEmpty
                                ? subtitles[index]
                                : 'Discover the Latest Trends',
                            style: const TextStyle(color: Colors.white70),
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: widget.onShopNow,
                            child: const Text('Shop Now'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
