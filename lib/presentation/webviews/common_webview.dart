import 'package:auto_route/annotations.dart';
import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/presentation/home/components/order_details_widget.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/custom_app_bar/app_bar.dart';
import 'package:distributor_empower/widgets/progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class CommonWebViewScreen extends StatefulWidget {
  final String url;
  final String? title;

  const CommonWebViewScreen({super.key, required this.url, this.title});

  @override
  State<CommonWebViewScreen> createState() => _CommonWebViewScreenState();
}

class _CommonWebViewScreenState extends State<CommonWebViewScreen> {
  final controller = WebViewController();
  var isLoading = true;

  @override
  void initState() {
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(AppColor.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            isLoading = false;
            setState(() {});
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppBarWidget(
          toolbarHeight: AppBar().preferredSize.height,
          backgroundColor: const Color(0xFFF8FAFB),
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: AppColor.transparent, statusBarIconBrightness: Brightness.dark, statusBarBrightness: Brightness.dark),
          title: Text(
            widget.title ?? 'WebView',
            maxLines: 1,
            style: TextStyles.semiBold15.copyWith(color: AppColor.textSecondary),
          ),
          centerTitle: true,
          elevation: 0,
          flexibleSpace: null,
        ),
      ),
      body: ProgressWidget(inAsyncCall: isLoading, child: WebViewWidget(controller: controller)),
    );
  }
}
