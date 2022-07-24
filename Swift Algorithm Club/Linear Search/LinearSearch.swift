func linearSearch<T: Equatable>(array: [T], _ object: T) -> Int? {
  for (index, obj) in array.enumerate() where obj == object {
    return index
  }
  return nil
}
