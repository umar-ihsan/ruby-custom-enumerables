# Ruby Custom Enumerables

A from-scratch reimplementation of Ruby's core `Enumerable` methods, built test-first with RSpec.

This repository is a clone of [The Odin Project's Custom Enumerables repository](https://github.com/TheOdinProject/custom_enumerable_project). I solved all of the exercises as part of The Odin Project's Ruby on Rails path.

## Highlights

- **Nine core iteration methods rebuilt by hand**, with no delegation to the built-in versions.
- **Block and enumerator handling**: each method uses `yield` and `block_given?`, and returns an `Enumerator` via `to_enum` when called without a block, as Ruby's own methods do.
- **Test-driven workflow**: each method was written against its own RSpec file, and I ran the spec to see it fail before I implemented the method.
- **Idiomatic Ruby**: monkey-patching core classes, early returns, and accumulator patterns.

## Implemented Methods

| Method                     | Behavior                                                    | Spec                              |
| -------------------------- | ----------------------------------------------------------- | --------------------------------- |
| `Array#my_each`            | Yields each element in turn                                 | `spec/my_each_spec.rb`            |
| `Array#my_each_with_index` | Yields each element with its index                          | `spec/my_each_with_index_spec.rb` |
| `Array#my_select`          | Returns the elements for which the block is truthy          | `spec/my_select_spec.rb`          |
| `Array#my_all?`            | `true` if the block is truthy for every element             | `spec/my_all_spec.rb`             |
| `Array#my_any?`            | `true` if the block is truthy for at least one element      | `spec/my_any_spec.rb`             |
| `Array#my_none?`           | `true` if the block is truthy for no element                | `spec/my_none_spec.rb`            |
| `Array#my_count`           | Returns the number of elements, or the number matching a block | `spec/my_count_spec.rb`        |
| `Array#my_map`             | Returns a new array of the block's return values            | `spec/my_map_spec.rb`             |
| `Array#my_inject`          | Reduces the elements to one value, starting from an initial value | `spec/my_inject_spec.rb`    |

All implementations live in [`lib/my_enumerables.rb`](lib/my_enumerables.rb).

## Example

```ruby
require_relative "lib/my_enumerables"

[1, 2, 3, 4].my_select { |n| n.even? }          # => [2, 4]
[1, 2, 3, 4].my_map { |n| n * n }               # => [1, 4, 9, 16]
[1, 2, 3, 4].my_inject(0) { |sum, n| sum + n }  # => 10
[1, 2, 3, 4].my_all? { |n| n > 0 }              # => true
```

## Getting Started

**Prerequisites:** Ruby 3.4.6 (see `.ruby-version`) and Bundler.

```bash
git clone https://github.com/umar-ihsan/ruby-custom-enumerables.git
cd ruby-custom-enumerables
bundle install
```

## Running the Tests

Run the whole suite:

```bash
bundle exec rspec
```

Or run a single spec:

```bash
bundle exec rspec spec/my_each_spec.rb
```

## Tech Stack

- **Language:** Ruby 3.4
- **Testing:** RSpec
- **Dependency management:** Bundler

