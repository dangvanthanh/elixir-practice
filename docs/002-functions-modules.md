# Functions and Modules

## Anonymous functions

Anonymous functions start with `fn` and end with `end`

```
iex> add = fn a, b -> a + b end

iex> add.(2, 4)
6
```

> a dot `.` between the variable `add` and parentesis is required to invoke an anonymouss function

## Modules

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

## Initialize project

```
$ mix new [project name]
```


