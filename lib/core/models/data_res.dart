abstract class DataRes<T> {
  final T? data;
  final String? error;

  const DataRes({this.data, this.error});
}

class DataSuccess<T> extends DataRes<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataRes<T> {
  const DataFailed(String error) : super(error: error);
}
