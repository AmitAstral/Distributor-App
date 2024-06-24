import 'package:auto_route/annotations.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

@RoutePage()
class VideoPlayerScreen extends StatefulWidget {
  final String productArguments;
  final String title;

  const VideoPlayerScreen({super.key, required this.productArguments, required this.title});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late final VideoPlayerController _controller;
  late Future<void> videoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _setOrientation([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    _controller = VideoPlayerController.networkUrl(Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        setState(() {});
      });

    _controller.setLooping(true);
  }

  _setOrientation(List<DeviceOrientation> orientations) {
    SystemChrome.setPreferredOrientations(orientations);
  }

  @override
  void dispose() {
    super.dispose();

    _setOrientation([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.r))),
                child: VideoPlayer(_controller),
              ),
            ),
            Positioned(
              bottom: 7,
              left: 0,
              right: 0,
              child: VideoProgressIndicator(
                _controller,
                allowScrubbing: true,
                colors: const VideoProgressColors(
                  backgroundColor: Colors.white,
                  playedColor: AppColor.primaryColor,
                ),
              ),
            ),
            Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 0,
                child: InkWell(
                    onTap: () {
                      setState(() {
                        _controller.value.isPlaying ? _controller.pause() : _controller.play();
                      });
                    },
                    child: _controller.value.isPlaying
                        ? Container()
                        : Container(
                            padding: EdgeInsets.all(70.w),
                            child: Icon(
                              Icons.play_arrow_rounded,
                              size: 50.w,
                              color: AppColor.white.withOpacity(0.8),
                            ),
                          ))),
          ],
        ),
      ),
    );
  }
}
