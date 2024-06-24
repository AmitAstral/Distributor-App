import 'package:auto_route/annotations.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/cache_network_image_widget.dart';
import 'package:distributor_empower/widgets/custom_app_bar/app_bar.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ViewImageScreen extends StatefulWidget {
  final String? productArguments;
  final String title;

  const ViewImageScreen({required this.title, required this.productArguments, super.key});

  @override
  State<ViewImageScreen> createState() => _ViewImageScreenState();
}

class _ViewImageScreenState extends State<ViewImageScreen> {
  final viewTransformationController = TransformationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppBarWidget(
          toolbarHeight: AppBar().preferredSize.height,
          title: Text(
            widget.title,
            maxLines: 1,
            style: TextStyles.semiBold15,
          ),
          centerTitle: true,
          elevation: 0,
          flexibleSpace: null,
        ),
      ),
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: InteractiveViewer(
            transformationController: viewTransformationController,
            minScale: 1.0,
            panEnabled: false,
            maxScale: 1.6,
            scaleFactor: BorderSide.strokeAlignCenter,
            child: CachedNetworkImageWidget(
              imageUrl: widget.productArguments.toString(),
            ),
          ),
        ),
      ),
    );
  }
}
