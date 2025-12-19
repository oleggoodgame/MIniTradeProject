// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bid_ask_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BidAskCounter)
const bidAskCounterProvider = BidAskCounterProvider._();

final class BidAskCounterProvider
    extends
        $NotifierProvider<
          BidAskCounter,
          List<Map<Map<double, double>, Map<double, double>>>
        > {
  const BidAskCounterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bidAskCounterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bidAskCounterHash();

  @$internal
  @override
  BidAskCounter create() => BidAskCounter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(
    List<Map<Map<double, double>, Map<double, double>>> value,
  ) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<
            List<Map<Map<double, double>, Map<double, double>>>
          >(value),
    );
  }
}

String _$bidAskCounterHash() => r'f50435a55c1f337892687afced6cf797b4f3e4ce';

abstract class _$BidAskCounter
    extends $Notifier<List<Map<Map<double, double>, Map<double, double>>>> {
  List<Map<Map<double, double>, Map<double, double>>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              List<Map<Map<double, double>, Map<double, double>>>,
              List<Map<Map<double, double>, Map<double, double>>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                List<Map<Map<double, double>, Map<double, double>>>,
                List<Map<Map<double, double>, Map<double, double>>>
              >,
              List<Map<Map<double, double>, Map<double, double>>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
