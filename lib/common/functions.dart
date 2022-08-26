String formatId(int id) {
  if (id < 10) return '#00$id';
  if (id < 99) return '#0$id';
  return '#$id';
}