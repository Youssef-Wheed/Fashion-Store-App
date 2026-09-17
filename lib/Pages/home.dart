import 'package:fashion_store_app/Widgets/Custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:video_player/video_player.dart';

import '../data/category_data.dart';
import '../Widgets/custom_appbar.dart';
import 'categories.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(
      'assets/video/video.mp4',
    )..initialize().then((_) {
      if (!mounted) return;

      setState(() {});

      _controller
        ..setLooping(true)
        ..play();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: CustomAppbar(
        title: 'Runway',
        prefix: 'assets/svgs/menu.svg',
        suffix: 'assets/svgs/notification.svg',
      ),

      body: Stack(
        children: [
          // =========================
          // Video
          // =========================
          if (_controller.value.isInitialized)
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),

          // =========================
          // Categories
          // =========================
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 150,
              color: Colors.white,

              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(10),

                    CustomText(
                      text: 'Categories',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff131313),
                    ),

                    const Gap(12),

                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: categoryList.length,
                        addRepaintBoundaries: true,
                        itemBuilder: (context, index) {
                          final category = categoryList[index];

                          return Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Categories(),
                                  ),
                                );
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    category.image,
                                    width: 65,
                                    height: 65,
                                    fit: BoxFit.cover,
                                    cacheWidth: 130,
                                  ),
                                  const Gap(6),
                                  SizedBox(
                                    width: 75,
                                    child: Center(
                                      child: CustomText(
                                        text: category.name,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff131313),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}