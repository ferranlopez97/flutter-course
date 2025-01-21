import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/home/home_screen.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo("Busca la comida", "Elit nostrud aute ex do ipsum.",
      "assets/images/1.png"),
  SlideInfo(
      "Entrega rapida",
      "Esse aute irure deserunt duis aute laborum esse minim nulla nisi nulla officia qui.",
      "assets/images/2.png"),
  SlideInfo("Disfruta la comida", "Est ad amet incididunt dolore Lorem ad.",
      "assets/images/3.png"),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = "tutorial_screen";
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();

  bool endReached = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pageViewController.addListener(() {

      final page = pageViewController.page ?? 0;

      if (!endReached && page>= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }

      print("${pageViewController.page}");
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageViewController.dispose();
    super.dispose();
  }


  void goToHomeScreen(BuildContext context) {
    context.goNamed(HomeScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children:
                slides.map((slideData) => _Slide(slide: slideData)).toList(),
          ),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton.icon(
                iconAlignment: IconAlignment.end,
                label: const Text("Skip"),
                icon: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 13,
                ),
                onPressed: () => goToHomeScreen(context),
              )),
          endReached ? Positioned(
              right: 30,
              bottom: 30,
              child: FadeInRight(
                from: 15,
                delay: const Duration(milliseconds: 500),
                child: FilledButton(
                    onPressed: () => goToHomeScreen(context), 
                    child: const Text("Start")
                ),
              )
          ) : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({required this.slide});

  final SlideInfo slide;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(slide.imageUrl),
            const SizedBox(
              height: 20,
            ),
            Text(
              slide.title,
              style: textTheme.titleLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              slide.caption,
              style: textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}
