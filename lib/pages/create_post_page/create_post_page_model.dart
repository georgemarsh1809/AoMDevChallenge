import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'create_post_page_widget.dart' show CreatePostPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreatePostPageModel extends FlutterFlowModel<CreatePostPageWidget> {
  ///  Local state fields for this page.
  /// category value
  String? category = 'None';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for post_content widget.
  FocusNode? postContentFocusNode;
  TextEditingController? postContentTextController;
  String? Function(BuildContext, String?)? postContentTextControllerValidator;
  String? _postContentTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Post text is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 200) {
      return 'Maximum 200 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  bool isDataUploading_uploadData79u = false;
  FFUploadedFile uploadedLocalFile_uploadData79u =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData79u = '';

  @override
  void initState(BuildContext context) {
    postContentTextControllerValidator = _postContentTextControllerValidator;
  }

  @override
  void dispose() {
    postContentFocusNode?.dispose();
    postContentTextController?.dispose();
  }
}
