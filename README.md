# All The Things

![](http://i.imgur.com/BcUkNhq.jpg)  

> Most good programmers do programming not because they expect to get paid or get adulation by the public, but because it is fun to program. -[Linus Torvalds](https://en.wikipedia.org/wiki/Linus_Torvalds)
 

## Learning Objectives

* Learn about inheritance
* Finish the lab

## Classes

In this lab, the final lab in the classes unit, you'll be constructing some classes to represent different kinds of vehicles. You'll have to implement several methods according to a spec (described below in the Instructions section) in order to make a set of tests pass.

Before you get started, though, you have one concept left to learn: Inheritance.

## Inheritance

Let's say you're creating a few classes to represent animals. Animals have a few common attributes: They have some number of legs (including zero legs in the case of animals like fish), and a species name. Animals can also make sounds. There are also specific kinds of animals, such as insects and cats, that have slightly different attributes.

In order to represent animals, you could create a class to contain those attributes. An `Animal` class might look like this:

```swift
class Animal {
    let speciesName: String
    let numberOfLegs: Int

    init(speciesName: String, numberOfLegs: Int) {
        self.speciesName = speciesName
        self.numberOfLegs = numberOfLegs
    }

    func speak() -> String {
        return ""
    }
}
```

Using this class as a base, you could create other animals, like horses, insects, and pet cats. These animals would all have the basic attributes in common, but would implement their own behavior and override the base animal's behavior, too.

To implement more specific animal classes, you can _inherit_ from the base `Animal` class.

A class that inherits from another implements some of the behavior of the base class, but can override or add new behavior, too. For example, here's an `Insect` class that provides its own initializer, and also overrides the base `Animal`'s `speak()` method, as well as adding a `fly()` method.

```swift
class Insect: Animal {
    init(speciesName: String) {
        super.init(speciesName: speciesName, numberOfLegs: 6)
    }

    override func speak() -> String {
        return "Bzzzz"
    }

    func fly() {
        print("Flying!")
    }
}
```

Let's examine what's happening here. First of all, the class definition looks a bit different. Instead of just `class Insect`, you wrote `class Insect: Animal`. The part after the colon indicates that `Insect` _inherits_ from `Animal`. That means that an `Insect` _is_ an `Animal`, and so can do everything an `Animal` can do. It has properties like `speciesName` and `numberOfLegs`, just like an `Animal`. But it also adds a `fly()` method that only an `Insect` would have.

Take a look at the initializer, too. It calls `super.init(speciesName:numberOfLegs:)`, the `Animal` class's initializer. `super` refers to the _superclass_ (the class that `Insect` inherits from), and calls the superclass's initializer.

`Insect` also overrides the `speak()` method from `Animal` to return "Bzzzz". In order to let the Swift compiler know that you are overriding a superclass's method, you mark it with the `override` keyword. This lets Swift know that you didn't accidentally create a method with the same name as one in the superclass—you did, in fact, intend to override it.

A `Cat` class might look like this:

```swift
class Cat: Animal {
    let owner: String

    init(owner: String) {
        super.init(speciesName: "Feline", numberOfLegs: 4)
    }

    override func speak() -> String {
        return "Meow!"
    }
}
```

Now that you know about inheritance, let's get on with the lab!

<a href='https://learn.co/lessons/ClassesAll' data-visibility='hidden'>View this lesson on Learn.co</a>
