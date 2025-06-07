import 'dart:async';

import 'package:dashboard/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tflite_web/tflite_web.dart';

TFLiteModel? model;

Future<void> main() async {
  await [
    Supabase.initialize(
      url: 'https://ybxrssqgwknttzqdyywt.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlieHJzc3Fnd2tudHR6cWR5eXd0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDM1MDY4NjAsImV4cCI6MjA1OTA4Mjg2MH0.bPrEmkJBPEgqcsszIQO_EihWmtWW5mWwFmFK_mMNrbU',
    ),
    TFLiteWeb.initialize(),
  ].wait;

  unawaited(
    TFLiteModel.fromUrl('assets/emg_model.tflite').then((v) {
      model = v;
    }),
  );

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
