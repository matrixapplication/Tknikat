import 'package:pod_player/pod_player.dart';
import 'package:flutter/material.dart';

class PlayVideoFromNetwork extends StatefulWidget {
  final String url;
  const PlayVideoFromNetwork({Key? key, required this.url}) : super(key: key);

  @override
  State<PlayVideoFromNetwork> createState() => _PlayVideoFromNetworkState();
}

class _PlayVideoFromNetworkState extends State<PlayVideoFromNetwork> {
  late final PodPlayerController controller;

  @override
  void initState() {
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.youtube(
       widget.url,
      ),
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PodVideoPlayer(controller: controller,
      onVideoError: (){
        return Container(
          color: Colors.white,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.warning,color: Colors.yellow,size: 50,),
              SizedBox(height: 30,),
              Text('هذا الفيديو غير صالح حاليا',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
              )
            ],
          ),
        );
      },
      ),
    );
  }
}