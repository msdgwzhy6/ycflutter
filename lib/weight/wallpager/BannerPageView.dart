import 'package:flutter/material.dart';
import 'package:ycflutter/weight/wallpager/BannerData.dart';
import 'package:ycflutter/weight/wallpager/IntroPageItem.dart';
import 'package:ycflutter/weight/wallpager/PageTransformer.dart';


class BannerPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox.fromSize(
          size: const Size.fromHeight(200.0),
          child: PageTransformer(
            pageViewBuilder: (context, visibilityResolver) {
              return PageView.builder(
                controller: PageController(viewportFraction: 0.85),
                itemCount: sampleItems.length,
                itemBuilder: (context, index) {
                  final item = sampleItems[index];
                  final pageVisibility = visibilityResolver.resolvePageVisibility(index);
                  return IntroPageItem(
                    item: item,
                    pageVisibility: pageVisibility,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
