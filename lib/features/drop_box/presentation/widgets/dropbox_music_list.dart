part of '../pages/dropbox_music_page.dart';

class DropboxMusicList extends ConsumerStatefulWidget {
  const DropboxMusicList({super.key});

  @override
  ConsumerState<DropboxMusicList> createState() => _DropboxMusicListState();
}

class _DropboxMusicListState extends ConsumerState<DropboxMusicList> {
  @override
  Widget build(BuildContext context) {
    final dropBoxFetchNotifier = ref.read(dropboxMusicFetchProvider.notifier);
    final dropBoxMusicDownloadNotifier =
        ref.read(dropBoxMusicDownloadProvider.notifier);
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: dropBoxFetchNotifier.musicList.length,
      itemBuilder: (_, index) {
        final musicName = dropBoxFetchNotifier.musicList[index];
        return Container(
          margin: const EdgeInsets.only(
            bottom: 10,
            left: 10,
            right: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white10, //const Color(0xff1c1f29),
          ),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            tileColor: bgColor,
            leading: const Icon(
              Icons.music_note,
              size: 30,
              color: Colors.white,
            ),
            title: Text(
              musicName.name,
              maxLines: 1,
              style: AppTextStyle.textStyleOne(
                Colors.white,
                20,
                FontWeight.w400,
              ),
            ),
            trailing: dropBoxMusicDownloadNotifier.downloadItems
                        .contains(musicName.name) ||
                    musicName.isDownloaded
                ? IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.download_for_offline_outlined,
                      color: Colors.white,
                      size: 25,
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      HapticFeedback.mediumImpact();
                      ref
                          .read(
                            dropBoxMusicDownloadProvider.notifier,
                          )
                          .downloadTest(musicName.name, index);
                    },
                    icon: const Icon(
                      Icons.download,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
