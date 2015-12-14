# Locator

Display locations on a list or a map

## Running the project

- Install the [cocoapods](https://cocoapods.org) gem

```
sudo gem install cocoapods
```

- Run the following command in Terminal.app

```
pod install
```

- Open `Project.xcworkspace`

## Updating generated models

- Install [mogenerator](http://rentzsch.github.io/mogenerator/)
- Run the following command in Terminal.app

```
mogenerator \
--swift \
--model Library/Models/Project.xcdatamodeld/Project.xcdatamodel \
--output-dir Library/Models \
--v2
```
