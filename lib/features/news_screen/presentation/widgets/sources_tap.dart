import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_appp/core/dependency%20_njection/di.dart';
import 'package:news_appp/core/themes/app_text_styles.dart';
import 'package:news_appp/core/themes/bloc/cubit.dart';
import 'package:news_appp/features/news_screen/presentation/controller/sources/sources_cubit.dart';

class SourcesTap extends StatelessWidget {
  SourcesTap({super.key, required this.categoryLable,required this.changeSelectedSource});

  final String categoryLable;
  final void Function(String) changeSelectedSource ;
  @override
  Widget build(BuildContext context) {
    final color = context.watch<ThemeCubit>().state.color;
    final colorStyle = AppTextStyles(color: color);
    return BlocProvider(
      create: (context) => getIt<SourcesCubit>()..getSources(categoryLable),
      child: BlocBuilder<SourcesCubit, SourcesState>(
        builder: (context, state) {
          if (state is SourcesLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SourcesSuccess) {
            return DefaultTabController(
              length: state.sources.length,
              child: TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                indicatorColor: color.secondary,
                dividerColor: Colors.transparent,
                labelStyle: colorStyle.sourcesSelectedLableStyleB700,
                unselectedLabelStyle:
                    colorStyle.sourcesUnSelectedLableStyleB500,
                tabs: state.sources
                    .map((e) => Tab(child: Text(e.name)))
                    .toList(),
                onTap: (name){
                  changeSelectedSource(state.sources[name].id);
                  print("the tap  ########## =========${state.sources[name].id}");
                },
              ),
            );
          } else if (state is SourcesError) {
            return Center(
              child: Text(
                state.errorMessage,
                style:  colorStyle.mBarTest,
              ),
            );
          }
          else{
            return Text("");
          }
        },
      ),
    );
  }
}
