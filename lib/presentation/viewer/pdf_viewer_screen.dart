import 'package:auto_route/annotations.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/presentation/base_stateful_widget.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/custom_app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

@RoutePage()
class PDFViewerScreen extends BaseStatefulWidget {
  final String url;
  final String title;

  const PDFViewerScreen({required this.url, required this.title, super.key});

  @override
  BaseState<PDFViewerScreen> createState() => _PDFViewerScreenState();
}

class _PDFViewerScreenState extends BaseState<PDFViewerScreen> {
  final _pdfViewerKey = PdfViewerController();

  @override
  void dispose() {
    _pdfViewerKey.dispose();
    super.dispose();
  }

  @override
  Widget buildBody(BuildContext context) {
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
      body: SfPdfViewer.network(
        widget.url,
        controller: _pdfViewerKey,
      ),
    );
  }
}
