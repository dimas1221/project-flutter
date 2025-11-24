abstract class Mapper<I, O> {
  O map(I input);
}

class ListMapper<I, O> extends Mapper<List<I>, List<O>> {
  final Mapper<I, O> itemMapper;

  ListMapper(this.itemMapper);

  @override
  List<O> map(List<I> input) {
    return input.map((e) => itemMapper.map(e)).toList();
  }
}
