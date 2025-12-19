// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'f_chart_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Counter)
const counterProvider = CounterProvider._();

final class CounterProvider extends $NotifierProvider<Counter, List<FlSpot>> {
  const CounterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'counterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$counterHash();

  @$internal
  @override
  Counter create() => Counter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<FlSpot> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<FlSpot>>(value),
    );
  }
}

String _$counterHash() => r'b2ba9d67752011d44b0ddb67e8c25f9b3a7e1749';

abstract class _$Counter extends $Notifier<List<FlSpot>> {
  List<FlSpot> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<FlSpot>, List<FlSpot>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<FlSpot>, List<FlSpot>>,
              List<FlSpot>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
