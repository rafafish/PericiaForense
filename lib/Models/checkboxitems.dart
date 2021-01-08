class CheckBoxItems {
  String label;
  int id;
  bool checked;
  bool enabled;

  CheckBoxItems({this.label, this.id, this.checked, this.enabled});

  Map<String, dynamic> toMap() {
    return {'label': label, 'id': id, 'checked': checked, 'enabled': enabled};
  }

  CheckBoxItems.fromMap(dynamic obj) {
    this.label = obj['label'];
    this.id = obj['id'];
    this.checked = obj['checked'];
    this.enabled = obj['enabled'];
  }
}
