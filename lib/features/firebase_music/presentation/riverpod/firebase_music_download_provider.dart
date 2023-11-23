import 'package:core/core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/core/constants/hive_db.dart';
import 'package:music_app/features/firebase_music/presentation/riverpod/music_dowload_provider.dart';
import 'package:path_provider/path_provider.dart';

import '../../../dashboard/presentation/riverpod/audio_player_provider.dart';
import '../../../dashboard/presentation/riverpod/get_audio_provider.dart';

part './firebase_music_download_notifier.dart';
part './firebase_music_download_state.dart';

final firebaseMusicDownloadProvider =
    NotifierProvider<FirebaseMusicDownloadNotifier, FirebaseMusicDownloadState>(
  FirebaseMusicDownloadNotifier.new,
);