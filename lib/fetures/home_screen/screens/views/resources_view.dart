import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:news_appp/di.dart';
import 'package:news_appp/repository/local/home_local_repo_impl.dart';

import '../../../../core/network/api_manager.dart';
import '../../../../repository/local/home_local_repo.dart';
import '../../../../repository/remote/home_remote_repo_impl.dart';
import '../../../bloc/cubit.dart';
import '../../../bloc/states.dart';
import '../news_screen.dart';

class SourcesView extends StatelessWidget {
  SourcesView({super.key, required this.catId});
  String catId;
  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: BlocProvider(
        create: (context) =>getIt<HomeCubit>()..getSources(catId),
        child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {
            if (state is GetSourcesLoadingState ||
                state is GetNewsDataLoadingState) {
              context.loaderOverlay.show();
            }
            else{
              context.loaderOverlay.hide();
            }
          },
          builder: (context, state) {
            var bloc = BlocProvider.of<HomeCubit>(context);
            return Column(
              children: [
                DefaultTabController(
                  length: bloc.sources.length,
                  initialIndex: bloc.selectedIndex,
                  child: TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    onTap: (v) {
                      bloc.changeSelectedIndex(v);
                    },
                    labelStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    unselectedLabelStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    dividerColor: Colors.transparent,
                    indicatorColor: Colors.black,
                    tabs: bloc.sources
                        .map((e) => Tab(child: Text(e.name ?? "")))
                        .toList(),
                  ),
                ),
                Expanded(
                  child: NewsScreen(
                    // sourceId: bloc.sources[bloc.selectedIndex].id ?? "",
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
