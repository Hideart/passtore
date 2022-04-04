extension IterableExtension<E> on Iterable<E> {
  E? find(bool Function(E) check) {
    for (E element in this) {
      if (check(element)) return element;
    }
    return null;
  }
}
