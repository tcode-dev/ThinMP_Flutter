import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/provider/page/artists_provider.dart';
import 'package:thinmpf/view/loading/loading_widget.dart';
import 'package:thinmpf/view/page/artist_detail_page_widget.dart';
import 'package:thinmpf/view/player/mini_player_widget.dart';
import 'package:thinmpf/view/row/artist_action_row_widget.dart';
import 'package:thinmpf/view/row/empty_row_widget.dart';

class ArtistsPageWidget extends ConsumerWidget {
  const ArtistsPageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(artistsProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        surfaceTintColor: Colors.transparent,
        title: Text(AppLocalizations.of(context)!.artists),
      ),
      body: Stack(
        children: [
          asyncValue.when(
            loading: () => const LoadingWidget(),
            error: (Object error, StackTrace stackTrace) {
              return ErrorWidget(error);
            },
            data: (vm) {
              return CustomScrollView(
                slivers: [
                  SliverFixedExtentList(
                    itemExtent: StyleConstant.row.borderBoxHeight,
                    delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                      final artist = vm.artists[index];
                      return ArtistActionRowWidget(
                        artist: artist,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ArtistDetailPageWidget(id: artist.id)),
                          );
                        },
                      );
                    }, childCount: vm.artists.length),
                  ),
                  const SliverToBoxAdapter(
                    child: EmptyRowWidget(),
                  ),
                ],
              );
            },
          ),
          const Positioned(
            right: 0.0,
            bottom: 0.0,
            left: 0.0,
            child: MiniPlayerWidget(),
          ),
        ],
      ),
    );
  }
}
