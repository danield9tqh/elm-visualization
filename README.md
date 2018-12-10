# elm-visualization

This project was my attempt to combine the [Elm programming language](http://elm-lang.org/) with the drawing program [Sketch](https://www.sketchapp.com/). Sketch is a very popular tool for content designers. After a page is designed in Sketch however, the page still needs to be translated into UI code. This translation process can involve a lot of back and forth between designers and developers because the entire design of a page (user intereaction, page resizing behavior etc.) cannot be fulley conveyed in a 2D design image. My goal with this project was to experiment with creating a tool to allow designers to translate their designs into maintainable code, without developer interaction. The first step in that experiement was to translate Sketch SVG images into maintanable Elm front end code. For this project I used heavily [Sketch's copy SVG feature](https://sketchapp.com/docs/exporting/code-export/) as well as Atom's [html-to-elm package](https://atom.io/packages/html-to-elm). Check out the results. Setup instructions are below.

## Setup
Make sure you have the elm language installed: https://guide.elm-lang.org/install.html

Next, check out this repo and start the elm project
```bash
git clone https://github.com/danield9tqh/elm-visualization.git
cd elm-visualization
elm-reactor
```

Now the Elm code should be running locally. Some files to play around with are:
* [Growing Cursive](http://localhost:8000/GrowingCursive.elm)
* [Growing Branches](http://localhost:8000/GrowingBranches.elm)
* [Growing Tree](http://localhost:8000/GrowingTree.elm)

## Sketch and Elm
If you would like to render SVG code from Sketch in Elm, it's pretty simple
  1) Create a Sketch drawing
  2) Copy the SVG Code from Sketch and paste into Atom
  3) Use the Atom html-elm package to convert the SVG into Elm code
  4) Some manual coercion of the code is necessary so that it works with [Elm's SVG library](http://package.elm-lang.org/packages/elm-lang/svg/latest/)

If you would like to see a simple, completed example check out the cursive 'D' in `CursiveSVG.elm` and it's corresponding Sketch source file `CursiveD.sketch`. You can replicate the growing effect with an arbitrary SVG path made in Sketch with little effort.
