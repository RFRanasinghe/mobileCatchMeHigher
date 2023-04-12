import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ExerciseHomePage extends StatefulWidget {
  const ExerciseHomePage({Key? key}) : super(key: key);

  @override
  _ExerciseHomePageState createState() => _ExerciseHomePageState();
}

class _ExerciseHomePageState extends State<ExerciseHomePage> {
  List<VideoPlayerController> _controllers = [];
  late Future<void> _initializeVideoPlayerFuture;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controllers.add(
      VideoPlayerController.asset('videos/morningwork.mp4')
        ..initialize().then((_) {
          setState(() {});
        }),
    );

    _controllers.add(
      VideoPlayerController.asset('videos/exercise1.mp4')
        ..initialize().then((_) {
          setState(() {});
        }),
    );

    _controllers.add(
      VideoPlayerController.asset('videos/strongarms.mp4')
        ..initialize().then((_) {
          setState(() {});
        }),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Exercise Home",
            style: TextStyle(
              fontSize: 26,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/galaxy.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.only(
                  top: 20.0, left: 20.0, bottom: 20, right: 20.0),
            ),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 30.0),
                child: SizedBox(
                  width: 350.0,
                  height: 600.0,
                  child: Stack(
                    children: [
                      _controllers[_currentIndex].value.isInitialized
                          ? AspectRatio(
                              aspectRatio:
                                  _controllers[_currentIndex].value.aspectRatio,
                              child: VideoPlayer(_controllers[_currentIndex]),
                            )
                          : Container(),
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _controllers[_currentIndex].value.isPlaying
                                  ? _controllers[_currentIndex].pause()
                                  : _controllers[_currentIndex].play();
                            });
                          },
                          child: Icon(
                            _controllers[_currentIndex].value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                            size: 100.0,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              _controllers.length,
                              (index) => GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _currentIndex = index;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 80.0, bottom: 100.0),
                                      child: Container(
                                        width: 50.0,
                                        height: 50.0,
                                        margin: EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: _currentIndex == index
                                              ? Colors.green
                                              : Colors.grey,
                                        ),
                                      ),
                                    ),
                                  )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
