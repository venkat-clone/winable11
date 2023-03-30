

class ValueState<T>{
  T? value;
  bool loading = false;
  String? error;
  ValueState({
    this.value,
    this.loading = false,
    this.error
  });
  ValueState.loading({
        this.value,
        this.error,
      }){
    this.loading = true;
  }
}

