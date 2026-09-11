part of 'sources_cubit.dart';

@immutable
sealed class SourcesState extends Equatable{
}

final class SourcesLoading extends SourcesState {
  @override
  List<Object?> get props => [];
}

final class SourcesSuccess extends SourcesState {
  SourcesSuccess(this.sources);
  final List<SourceModel> sources ;

  @override
  List<Object?> get props => [sources];
}
final class SourcesError extends SourcesState {
  final String errorMessage ;
  SourcesError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
