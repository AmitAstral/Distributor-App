import 'package:auto_route/annotations.dart';
import 'package:distributor_empower/presentation/base_statefull_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

@RoutePage()
class YoutubePlayerScreen extends BaseStatefulWidget {
  final String productArguments;

  const YoutubePlayerScreen({required this.productArguments, super.key});

  @override
  BaseState<YoutubePlayerScreen> createState() => _YoutubePlayerScreenState();
}

class _YoutubePlayerScreenState extends BaseState<YoutubePlayerScreen> {
  late final YoutubePlayerController? _ytbPlayerController;

  @override
  void initState() {
    super.initState();
    debugPrint('YOUTUBE URL----------------${widget.productArguments}');

    _setOrientation([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    _ytbPlayerController = YoutubePlayerController.fromVideoId(
      videoId: widget.productArguments.split('=').last,
      autoPlay: false,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );
  }

  @override
  void dispose() {
    super.dispose();

    _setOrientation([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _ytbPlayerController?.close();
  }

  void _setOrientation(List<DeviceOrientation> orientations) {
    SystemChrome.setPreferredOrientations(orientations);
  }

  @override
  Widget buildBody(BuildContext context) {
    return _buildYtbView();
  }

  Widget _buildYtbView() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: _ytbPlayerController != null
          ? YoutubePlayer(
              controller: _ytbPlayerController,
              aspectRatio: 16 / 9,
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
