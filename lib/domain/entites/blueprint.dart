import 'package:time_architect/domain/entites/block.dart';

class Blueprint {
  String title;
  final List<Block> _blocks = <Block>[];
  List<Block> get blocks => _blocks;
  Blueprint({
    required this.title,
  });

  void addBlock(Block block) => blocks.add(block);
}
