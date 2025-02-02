import 'package:base/base.dart';

sealed class Result<T> extends Equatable {
  const Result();
}

class ResultSuccess<T> extends Result<T> {
  const ResultSuccess(this.data);

  final T data;

  @override
  List<Object?> get props => [data];
}

class ResultError<T> extends Result<T> {
  const ResultError(this.exception, [this.data]);

  final Exception exception;
  final T? data;

  @override
  List<Object?> get props => [exception, data];
}

class ResultLoading<T> extends Result<T> {
  ResultLoading([this.data]);

  final T? data;

  @override
  List<Object?> get props => [data];
}

extension ResultX<T> on Result<T> {
  bool get isSuccess => this is ResultSuccess<T>;

  bool get isError => this is ResultError<T>;

  bool get isLoading => this is ResultLoading<T>;

  T? get dataOrNull {
    if (this is ResultSuccess<T>) {
      return (this as ResultSuccess<T>).data;
    } else if (this is ResultError<T>) {
      return (this as ResultError<T>).data;
    } else if (this is ResultLoading<T>) {
      return (this as ResultLoading<T>).data;
    } else {
      throw Exception('Unknown result type');
    }
  }

  ResultSuccess<T> get asSuccess => this as ResultSuccess<T>;

  ResultError<T> get asError => this as ResultError<T>;

  ResultError<T>? get asErrorOrNull =>
      this is ResultError<T> ? this as ResultError<T> : null;

  ResultLoading<T> get asLoading => this as ResultLoading<T>;

  Result<T?> map(Function(T?) mapper) {
    if (this is ResultSuccess<T>) {
      return ResultSuccess(mapper((this as ResultSuccess<T>).data));
    } else if (this is ResultError<T>) {
      return ResultError(
          (this as ResultError<T>).exception, mapper((this.dataOrNull)));
    } else if (this is ResultLoading<T>) {
      return ResultLoading(mapper((this.dataOrNull)));
    } else {
      throw Exception('Unknown result type');
    }
  }

  Result<O?> transform<O>({required Function(T?) transformer}) {
    if (this is ResultSuccess<T>) {
      return ResultSuccess(transformer((this as ResultSuccess<T>).data));
    } else if (this is ResultError<T>) {
      return ResultError(
          (this as ResultError<T>).exception, transformer((this.dataOrNull)));
    } else if (this is ResultLoading<T>) {
      return ResultLoading(transformer((this.dataOrNull)));
    } else {
      throw Exception('Unknown result type');
    }
  }
}

//
// fun <T> Flow<T>.asResult(): Flow<Result<T>> {
//     return this
//         .map<T, Result<T>> {
//             Result.Success(it)
//         }
//         .onStart { emit(Result.Loading) }
//         .catch { emit(Result.Error(it)) }
// }
