class UnhandledCase implements Exception {
  Type type;
  UnhandledCase(this.type);
  String toString() => "match() did not provide case for $type";
}

dynamic match(dynamic x, Map<dynamic, Function(dynamic)> cases) =>
    (cases[x.runtimeType] ?? (throw UnhandledCase(x.runtimeType)))(x);

dynamic tryMatch(dynamic x, Map<dynamic, Function(dynamic)> cases) =>
    cases[x.runtimeType]?.call(x);
