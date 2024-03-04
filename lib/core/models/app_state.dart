enum AppState {
  init,
  loading,
  finish;

  bool get isLoading => this == AppState.loading;
}
