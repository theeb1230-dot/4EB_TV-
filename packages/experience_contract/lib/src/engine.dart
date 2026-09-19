import 'experience.dart';

final class ExperienceEngine {
  ExperienceEngine({required ExperienceDescriptor defaultExperience})
      : _activeId = defaultExperience.id {
    register(defaultExperience);
  }

  final Map<String, ExperienceDescriptor> _registry = {};
  String _activeId;
  String? _previewId;

  String get activeId => _activeId;
  String? get previewId => _previewId;
  List<ExperienceDescriptor> get registered =>
      List.unmodifiable(_registry.values);

  void register(ExperienceDescriptor descriptor) {
    if (descriptor.id.trim().isEmpty) {
      throw ArgumentError.value(descriptor.id, 'id', 'must not be empty');
    }
    if (_registry.containsKey(descriptor.id)) {
      throw StateError('Duplicate Experience id');
    }
    _registry[descriptor.id] = descriptor;
  }

  ExperienceDescriptor? find(String id) => _registry[id];

  bool preview(String id, ExperienceContext context) {
    final descriptor = _registry[id];
    if (descriptor == null || !context.canActivate(descriptor)) {
      _previewId = null;
      return false;
    }
    _previewId = id;
    return true;
  }

  bool applyPreview(ExperienceContext context) {
    final id = _previewId;
    if (id == null) return false;
    final descriptor = _registry[id];
    if (descriptor == null || !context.canActivate(descriptor)) {
      _previewId = null;
      return false;
    }
    _activeId = id;
    _previewId = null;
    return true;
  }

  void cancelPreview() => _previewId = null;
}
