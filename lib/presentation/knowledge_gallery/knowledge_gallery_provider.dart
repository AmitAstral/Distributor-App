import 'package:distributor_empower/core/provider/base_provider.dart';
import 'package:distributor_empower/model/base/api_req_data.dart';
import 'package:distributor_empower/model/knowledge_gallery_model.dart';
import 'package:flutter/material.dart';

class KnowledgeGalleryProvider extends BaseProvider {
  List<KnowledgeGalleryModel?> knowledgeGalleryList = [];

  Future<void> getKnowledgeGalleryList({loading = true}) async {
    isLoading.value = loading || knowledgeGalleryList.isEmpty;
    try {
      final request = ApiReqData.getUserDetails;
      final response = await apiRep.getKnowledgeGalleryList(request, onApiError);
      if (response.getIsSuccess) {
        knowledgeGalleryList = response.dataList ?? [];
      }
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }
}
