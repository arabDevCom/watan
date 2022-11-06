import 'package:elwatn/core/widgets/network_image.dart';
import 'package:flutter/material.dart';
import 'package:scroll_navigation/misc/navigation_helpers.dart';
import 'package:scroll_navigation/navigation/title_scroll_navigation.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../home_page/domain/entities/main_item_domain_model.dart';
import '../widgets/veiw_map_widget.dart';

class DetailsPhotoScreen extends StatefulWidget {
  const DetailsPhotoScreen(
      {Key? key, this.initialPage = 0, required this.mainItem})
      : super(key: key);
  final int initialPage;
  final MainItem mainItem;

  @override
  State<DetailsPhotoScreen> createState() => _DetailsPhotoScreenState();
}

class _DetailsPhotoScreenState extends State<DetailsPhotoScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    if (widget.mainItem.videos!.isNotEmpty) {
      _controller = VideoPlayerController.network(
        widget.mainItem.videos!.first.attachment!,
      );
      _initializeVideoPlayerFuture = _controller.initialize();
      _controller.setLooping(true);
    }
  }

  @override
  void dispose() {
    if (widget.mainItem.videos!.isNotEmpty) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "Details",
          style: TextStyle(color: AppColors.black),
        ),
        iconTheme: IconThemeData(
          color: AppColors.black,
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: TitleScrollNavigation(
        initialPage: widget.initialPage,
        showIdentifier: false,
        barStyle: TitleNavigationBarStyle(
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 16,
                vertical: 12),
            spaceBetween: MediaQuery.of(context).size.width / 4 + 10,
            activeColor: AppColors.primary,
            background: AppColors.buttonBackground),
        titles: const [
          "Image",
          "Videos",
          "Map",
        ],
        pages: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text("Found Images ${widget.mainItem.images!.length}"),
                ),
                ...List.generate(
                  widget.mainItem.images!.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: ManageNetworkImage(
                      imageUrl: widget.mainItem.images![index].attachment!,
                      width: MediaQuery.of(context).size.width - 55,
                      height: 200,
                      borderRadius: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child:
                      Text("Found Video (${widget.mainItem.videos!.length})"),
                ),
                if (widget.mainItem.videos!.isNotEmpty) ...{
                  FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        );
                      } else {
                        return const SizedBox(
                          height: 150,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 25),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                        } else {
                          _controller.play();
                        }
                      });
                    },
                    child: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                  ),
                } else ...{
                  Container()
                },
              ],
            ),
          ),
          ViewMapWidget(
            latitude: widget.mainItem.latitude!,
            longitude: widget.mainItem.longitude!,
          ),
        ],
      ),
    );
  }
}
