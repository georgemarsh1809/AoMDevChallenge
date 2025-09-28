// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';

/// Adds display name to user document
Future<void> setAuthProfile(String displayName) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    throw Exception('No signed-in user.');
  }

  // Update display name
  await user.updateDisplayName(displayName);

  // Refresh the local user so FlutterFlow’s authUser sees new values
  await user.reload();
}
