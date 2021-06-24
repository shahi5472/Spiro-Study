import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spiro_study/model/search_model.dart';
import 'package:spiro_study/src/custom_colors.dart';
import 'package:spiro_study/src/strings.dart';
import 'package:spiro_study/utility/size_config.dart';
import 'package:video_player/video_player.dart';

class DetailScreen extends StatefulWidget {
  SearchModel? searchModel;

  DetailScreen({this.searchModel});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  VideoPlayerController? _playerController;

  void stateChange() {
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _playerController =
        //VideoPlayerController.network('${widget.searchModel!.video!.link}')
        VideoPlayerController.network(
            'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
          ..initialize()
          ..setLooping(true).then((value) {
            stateChange();
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ShowColors.purple_500,
        leading: IconButton(
          onPressed: () {
            Get.back(closeOverlays: true);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          '$appName | ${widget.searchModel!.title}',
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier! * 2.2,
            color: ShowColors.colorTextIcons,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: ShowColors.purple_200,
      body: Center(
        child:
            _playerController != null && _playerController!.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _playerController!.value.aspectRatio,
                    child: VideoPlayer(_playerController!),
                  )
                : CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            _playerController != null && _playerController!.value.isInitialized
                ? () {
                    _playerController!.value.isPlaying
                        ? _playerController!.pause()
                        : _playerController!.play();
                    stateChange();
                  }
                : null,
        child: Icon(
          _playerController!.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _playerController!.dispose();
  }
}
