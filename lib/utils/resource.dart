
enum ResourceState { loading, error, success }

class Resource<T> {
  final ResourceState state;
  final String message;
  final T? data;

  Resource(this.state, this.message, this.data);

  factory Resource.loading() => Resource(ResourceState.loading, '', null);
  factory Resource.error(String msg) => Resource(ResourceState.error, msg, null);
  factory Resource.success(T data) => Resource(ResourceState.success, '', data);

  T getData()=> data!;

}

