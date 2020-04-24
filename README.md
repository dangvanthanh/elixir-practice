# Learning Elixir

> Elixir is dynamic, functional language designed for building scalable and maintain applications

## Basic Types

Elixir has 7 basic types

- `integers`
- `floats`
- `booleans`
- `atoms`
- `strings`
- `lists`
- `tuples`

### Numbers

```
iex> 7 * 5
35

# when using the `/` with two integers this give a `float` number
iex> 20 / 2
10.0

# use `div` or `rem` functions
iex> div(14, 2)
7

iex> div 14, 2
7 

iex> rem 14, 2
0
```

### Booleans

Elixir support `true` and `false` as booleans. Besides, the booleans `true` and `false` Elixir also has the concept of a `truthy` or `falsy` value.

- the value is truthy when it is neither `false` nor `nil`
- the value is falsy when it is neither `false` or `nil`

```
iex> true
true

iex> false
false

# use `is_boolean` function
iex> is_boolean(1)
false

# truthy
iex> !!true
true

iex> !![4, 5]
true

# falsy
iex> !!false
false

iex> !!nil
false
```

### Atoms

Atoms are contains where their name is their own value (some other languages call these *Symbol*)

```
iex> :elixir
:elixir

# `true` and `false` are actually atoms in Elixir
iex> :elixir == :javascript
false

# name of modules in Elixir is atoms. `MyApp.MyModule` is a valid atoms, event if no such module has been declared yet
iex> is_atom(MyApp.MyModule)
true

# atoms are also used to reference modules from Erlang libraries, including built-in ones.
iex> :crypto.strong_rand_bytes 5
<<106, 202, 10, 18, 171>>
```

One popular use of atoms in Elixir is use them as messages for [pattern matching](https://en.wikipedia.org/wiki/Pattern_matching)

We could therefore use atoms to indicate whether or not this process is successfully (an `http` request processes)

```
def process(file) do
  lines = file |> split_lines

  case lines do
    nil ->
      {:error, "failed to process file"}
    lines -> 
      {:ok, lines}
  end
end
```

that method will return a `tuple` response

```
{:ok, lines} = process("elixir-and-elm.txt")
```

### Strings

String are surrounded by double quotes

```
iex> "Hello Elixir and Phoenix"
"Hello Elixir and Phoenix"

# print a string using a `IO` module
iex> IO.puts "Hello Elixir and Phoenix"
Hello Elixir and Phoenix
:ok
```

### Lists

Elixir use square brackets to make a list

```
iex> languages = ["Elixir", "Elm", "JavaScript"]
["Elixir", "Elm", "JavaScript"]

# use `length` function
iex> length(languages)
3

# concatenating lists together
iex> [1, 2, 3, 4, 5, 6, 7] ++ [8, 9, 10, 11, 12, 13, 14]
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]

# removing items from a list
iex> [22, 11, true, 88, false, true] -- [true, false]
[22, 11, 88, true]
```

Lists are *enumerable* and can use the *Enum* module to perform iterative functions such as mappings.

### Tuples

Elixir can use curly brackets to make a tuple

Tupes are similar to lists but are **not suited to data sets that need to be updated or added to rugularly**

```
iex> tuple = {:ok, "elixir"}
{:ok, "elixir"}

# get element in index 1
iex> elem(tuple, 1)
"elixir"

# get size of the tuple
iex> tuple_size(tuple)
2
```

### Lists or Tuples

|       | Reading                                            | Updating                       |
|-------|----------------------------------------------------|--------------------------------|
| list  | slow (getting its length and selecting an element) | fast (add and remove elements) |
| tuple | fast                                               | slow                           |

## Functions and Modules

### Anonymous functions

Anonymous functions start with `fn` and end with `end`

```
iex> add = fn a, b -> a + b end

iex> add.(2, 4)
6
```

> a dot `.` between the variable `add` and parentesis is required to invoke an anonymouss function

### Modules

With modules you're able to group several functions together. Most of the time is convenient to write modules into files so they can be complied and reused.

Example, creating file named `math.ex`

```elixir
defmodule Math do
  def sum(a, b) do
    a + b
  end

  def subtract(a, b) do
    a - b
  end

  def multiply(a, b) do
    a * b
  end

  def division(a, b) do
    a / b
  end
end
```

Complied file by typing `elixirc math.ex` for generate a file named `Elixir.Math.beam` containing the bytecode for the defined module.


```
$ elixirc math.ex
```

Then we start `iex` again, our module definition will be avaible.

```
iex> Math.sum(5, 7)
12
```

## Generating Elixir project

You need to make use the `Mix` build tool that comes straight out the box. Mix allows you to do a number things include:

- Create projects
- Compile projects
- Run tasks
  + Testing
  + Generate documentation
- Management dependencies

### Initialize project

```
$ mix new [project name]
```


