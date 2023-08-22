import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../providers/tutorial_provider.dart';

class TutorialCoachMarkManager {
  GlobalKey nameKey = GlobalKey();
  GlobalKey langKey = GlobalKey();
  GlobalKey themeKey = GlobalKey();
  GlobalKey fabKey = GlobalKey();

  TutorialCoachMark? tutorialCoachMark;
  List<TargetFocus> _target = [];
  TutorialProvider tutorialProvider = TutorialProvider();

  void initialTarget(BuildContext context) {
    _setTarget();
    tutorialCoachMark = TutorialCoachMark(
      targets: _target,
      hideSkip: true,
    )..show(context: context);
  }

  void _setTarget() {
    _target = [
      TargetFocus(
        radius: 12.0,
        shape: ShapeLightFocus.RRect,
        keyTarget: nameKey,
        identify: '1',
        contents: [
          TargetContent(
            builder: (context, controller) => Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 246, 224, 224),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    16,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text(
                      'This is app name. when you use this app you can write your daily task in here',
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            controller.skip();
                          },
                          child: const Text('Skip'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            controller.next();
                          },
                          child: const Text('Next'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      TargetFocus(
        radius: 12.0,
        shape: ShapeLightFocus.RRect,
        keyTarget: langKey,
        identify: '2',
        contents: [
          TargetContent(
            builder: (context, controller) => Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 246, 224, 224),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    16,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text(
                      'In this case for change language. This app supported three languages for example AZ, TR and EN',
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            controller.previous();
                          },
                          child: const Text('Back'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            controller.next();
                          },
                          child: const Text('Next'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      TargetFocus(
        shape: ShapeLightFocus.Circle,
        keyTarget: themeKey,
        identify: '3',
        contents: [
          TargetContent(
            builder: (context, controller) => Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 246, 224, 224),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    16,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text('You can switched app theme in here'),
                    Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            controller.previous();
                          },
                          child: const Text('Back'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            controller.next();
                            tutorialProvider.saveSignIn();
                          },
                          child: const Text('Next'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      TargetFocus(
        keyTarget: fabKey,
        identify: '4',
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) => Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 246, 224, 224),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    16,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text(
                      'You can add new task in here',
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            controller.previous();
                          },
                          child: const Text('Back'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            controller.skip();
                            tutorialProvider.saveSignIn();
                          },
                          child: const Text('Finish'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ];
  }
}
