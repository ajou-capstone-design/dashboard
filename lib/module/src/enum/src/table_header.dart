enum TableHeader {
  id(
    width: 1 / 3,
    value: '번호',
  ),
  name(
    width: 1 / 3,
    value: '이름',
  ),
  createdAt(
    width: 1 / 3,
    value: '생성일자',
  ),
  ;

  const TableHeader({
    required this.width,
    required this.value,
  });

  final double width;
  final String value;
}
