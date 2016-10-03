# Classes and Inheritance Lab 

![](http://i.imgur.com/BcUkNhq.jpg)  

> Most good programmers do programming not because they expect to get paid or get adulation by the public, but because it is fun to program. -[Linus Torvalds](https://en.wikipedia.org/wiki/Linus_Torvalds)
 
## Overview

In this lab, you'll constructsome classes to represent different kinds of vehicles. We'll also cover the topic of inheritance with classes. 

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

## Instructions 

In this lab, you'll create several classes, including some that inherit from others. This lab contains unit tests. When you first open the Xcode project, the tests will fail. You'll know you've successfully completed the lab when all the tests pass!

Open up `CatchEmAll.xcworkspace` to get started.

### `Vehicle`

The first class you must implement is the `Vehicle` class, in `Vehicle.swift`. Create a new class called `Vehicle`. Vehicle should contain these properties:

1. A constant `String` named `name`
2. A constant `Double` named `weight`
3. A constant `Double` named `maxSpeed`
4. A variable `Double` named `speed`
5. A variable `Double` named `heading`. (Note that this property should only accept values in the range 0 to 360.)

`Vehicle` should also have an initializer that takes `name, `weight`, and `maxSpeed` as parameters, and sets the appropriate properties. It should also set `speed` and `heading` to 0.0.

You should also add these methods to `Vehicle`. These methods take no parameters and return no values.

1. `goFast()`, which sets the vehicle's `speed` to its `maxSpeed`.
2. `halt()`, which sets the vehicle's `speed` to 0.
3. `accelerate()`, which increases the vehicle's `speed` by ⅒ its `maxSpeed`. It cannot increase the vehicle's `speed` beyond its `maxSpeed`.
4. `decelerate(0`, which decreases the vehicle's `speed` by ⅒ its `maxSpeed`. It cannot decrease the vehicle's `speed` below 0.
5. `turnRight()`, which increases the vehicle's `heading` by 90 and cuts its `speed` in half. If the vehicle's `heading` increases beyond 360, it wraps around again (that is, if the heading would be increased to 375, it wraps around to 15 again). The vehicle cannot turn if it is stationary (has a `speed` of 0).
6. `turnLeft()` which decreases the vehicle's `heading` by 90 and cuts its speed in half. If the vehicle's `heading` decreases below 0, it wraps around again (that is, if it would decrease to -15, it would instead wrap around to 345). The vehicle cannot turn if it is stationery (has a `speed` of 0).

### `Transmission`

Create an enum in `Vehicle.swift` called `Transmission`. It should have two cases:

1. `Automatic`
2. `Manual`

### `Car`

Next, you need to implement the `Car` class in `Car.swift`. `Car` should inherit from `Vehicle`. It should add three new properties:

1. A constant `Transmission` named `transmission`
2. A constant `Int` called `cylinders`
3. A constant `Double` called `milesPerGallon`

`Car` should also have an initializer that takes six parameters:

1. A `String` called `name`
2. A `Double` called `weight`
3. A `Double` called `maxSpeed`
4. A `Transmission` called `transmission`
5. An `Int` called `cylinders`
6. A `Double` called `milesPerGallon`

The initializer should first set the parameters specific to `Car`, then call `super.init` with the parameters required by the `Vehicle` superclass's initializer. Here's a hint: The `Car` initializer should look like this:

```swift
init(name: String, weight: Double, maxSpeed: Double, transmission: Transmission, cylinders: Int, milesPerGallon: Double) {
    self.transmission = transmission
    self.cylinders = cylinders
    self.milesPerGallon = milesPerGallon
    super.init(name: name, weight: weight, maxSpeed: maxSpeed)
}
```

Finally, `Car` should add two new methods, which again take no parameters and have no return value:

1. `drive()`, which simply calls `super.accelerate()`
2. `brake()`, which simply calls `super.decelerate()`

### `RaceCar`

Next, implement a `RaceCar` class in `RaceCar.swift`. This class should inherit from `Car` and add two new properties:

1. A constant `String` named `driver`
2. A variable `[String]` named `sponsors`

This class should also implement an initializer that takes eight parameters:

1. A `String` called `name`
2. A `Double` called `weight`
3. A `Double` called `maxSpeed`
4. A `Transmission` called `transmission`
5. An `Int` called `cylinders`
6. A `Double` called `milesPerGallon`
7. A `String` called `driver`
8. A `[String]` called `sponsors`

The initializer should assign the `driver` and `sponsors` parameters to the appropriate properties, then call the superclass's initializer with the remaining parameters.

The `RaceCar` class should also override two of `Vehicle`'s methods:

1. `accelerate()` should increase the race car's speed by ⅕ (instead of ⅒).
2. `decelerate()` should decrease the race car's speed by ⅕ (instead of ⅒).

The `RaceCar` class should also add two new methods, which take no parameters and return no values:

1. `driftRight()`, which increases the race car's `heading` by 90, but only decreases the speed by ¼ of its current speed. The race car cannot drift if it is not moving at all.
2. `driftLeft()`, which decreases the race car's `heading` by 90, but only decreases the speed by ¼ of its current speed. The race car cannot drift if it is not moving at all.

Both cases should handle out of range `heading` values the same as `turnRight()` and `turnLeft()`.

### `Plane`

Next, create a `Plane` class in `Plane.swift`. This class should inherit from `Vehicle` and add three new properties:

1. A constant `Double` named `maxAltitude`
2. A variable `Double` named `altitude`
3. A _calculated_ `Bool` named `inFlight`. This property should return `true` if both the `altitude` and `speed` are 0.

`Plane` should have an initializer that takes four parameters:

1. A `String` named `name`
2. A `Double` named `weight`
3. A `Double` named `maxSpeed`
4. A `Double` named `maxAltitude`

This initializer should assign the parameter `maxAltitude` to the `maxAltitude` property, and also set the `altitude` parameter to 0. It should then call the superclass's initializer with the remaining parameters.

`Plane` should also add six more methods, each of which take no parameters and return no value:

1. `takeOff()`, which sets the plane's `speed` and `altitude` to ⅒ of their maximums, but only if the plane is not already in flight.
2. `land()`, which sets the plane's `speed` and `altitude` to 0.
3. `climb()`, which increases the plane's altitude by ⅒ of the plane's `maxAltitude` and causes the plane to _decelerate_. It should not set the plane's `altitude` beyond its `maxAltitude`, or reduce the speed below 0. The plane can only climb if it is in flight.
4. `dive()`, which decreases the plane's altitude by ⅒ of the plane's `maxAltitude` and causes the plane to _accelerate_. It should not set the plane's `altitude` below 0 or increase the plane's `speed` beyond its `maximumSpeed`. The plane can only dive if it is in flight.
5. `bankRight()`, which increases the plane's `heading` by 45 but only decreases the plane's `speed` by ⅒ of its current value. The plane can only bank if it is in flight.
6. `bankLeft()`, which decreases the plane's `heading` by 45 but only decreases the plane's `speed` by ⅒ of its current value. The plane can only bank if it is in flight.

The same rules for handling out of range `heading` values apply to `bankLeft()` and `bankRight()`.

### `Jet`

Finally, you should implement a class called `Jet` in `Jet.swift`. It should inherit from `Plane`.

The `Jet` class should override two of methods from `Plane`:

1. Override `climb()` to increase the jet's altitude by ⅕ of its `maxAltitude`. Otherwise, the same rules for `Plane`'s `climb()` should apply.
2. Override `dive()` to dcrease the jet's altitude by ⅕ of its `maxAltitude`. Otherwise, the same rules for `Plane`'s `dive()` should apply.

The `Jet` class should also add one new method, which takes no parameters and returns no value:

1. `afterburner()`, which sets the jet's `speed` to _twice_ its `maxSpeed`, but _only_ if the jet is already flying at its `maxSpeed`.

### Finishing Up

That's it! If the tests pass, you completed the lab. If the tests don't pass, look back over these directions and try to figure out what you did wrong. Good luck!

<a href='https://learn.co/lessons/ClassesAll' data-visibility='hidden'>View this lesson on Learn.co</a>

<p class='util--hide'>View <a href='https://learn.co/lessons/swift-classesAll-lab'>Swift Classes All Lab</a> on Learn.co and start learning to code for free.</p>
