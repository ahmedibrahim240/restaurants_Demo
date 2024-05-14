// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';

/// A more efficient [StreamBuilder]
/// It requires [initialData] and will rebuild
/// only when the new data is different than the current data
/// The [comparator] is used to check if the new data is different
class BetterStreamBuilder<T extends Object> extends StatefulWidget {
  /// Creates a new BetterStreamBuilder
  const BetterStreamBuilder({
    required this.stream,
    required this.builder,
    this.initialData,
    this.noDataBuilder,
    this.errorBuilder,
    this.comparator,
    this.loadingBuilder,
    super.key,
  });

  /// The stream to listen to
  final Stream<T?>? stream;

  /// The initial data available
  final T? initialData;

  /// Comparator used to check if the new data is different than the last one
  final bool Function(T?, T?)? comparator;

  /// Builder that builds based on the new snapshot
  final Widget Function(BuildContext context, T data) builder;

  /// Builder that builds when the data is null
  final Widget Function(BuildContext context)? noDataBuilder;

  /// Builder used when there is an error
  final Widget Function(BuildContext context, Object error)? errorBuilder;
  final Widget Function(BuildContext context)? loadingBuilder;

  @override
  _BetterStreamBuilderState createState() => _BetterStreamBuilderState<T>();
}

class _BetterStreamBuilderState<T extends Object> extends State<BetterStreamBuilder<T>> {
  T? _lastEvent;
  StreamSubscription<T?>? _subscription;
  Object? _lastError;
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    if (widget.loadingBuilder?.call(context) != null) {
      if (_isLoading) {
        return widget.loadingBuilder?.call(context) ?? Container();
      }
    }
    final error = _lastError;
    if (error != null) {
      final errorBuilder = widget.errorBuilder;
      if (errorBuilder != null) {
        return errorBuilder(context, error);
      }
    }
    final event = _lastEvent;
    if (event == null) {
      return widget.noDataBuilder?.call(context) ?? const Offstage();
    }
    return widget.builder(context, event);
  }

  @override
  void initState() {
    _lastEvent = widget.initialData;
    _subscription = widget.stream?.listen(
      _onEvent,
      onError: _onError,
    );

    super.initState();
  }

  @override
  void didUpdateWidget(covariant BetterStreamBuilder<T> oldWidget) {
    if (oldWidget.stream != widget.stream) {
      _subscription?.cancel();
      _subscription = widget.stream?.listen(
        _onEvent,
        onError: _onError,
      );
      _isLoading = true;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  void _onError(error) {
    if (widget.errorBuilder != null && error != _lastError) {
      _lastError = error;
      if (mounted) {
        // ignore: no-empty-block
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _onEvent(T? event) {
    _lastError = null;
    final isEqual = widget.comparator?.call(_lastEvent, event) ?? event == _lastEvent;
    if (!isEqual) {
      _lastEvent = event;
      if (mounted) {
        setState(() {
          _isLoading = false;
        }); // ignore: no-empty-block
      }
    }
  }
}
