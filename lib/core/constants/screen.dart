enum Screen {
  home(title: "Meetings", tag: "home"),
  none(title: "", tag: "none");

  final String tag;
  final String title;

  const Screen({
    required this.title,
    String? tag,
  }) : tag = tag ?? title;
}
