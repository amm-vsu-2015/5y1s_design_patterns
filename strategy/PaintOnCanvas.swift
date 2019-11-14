
// Task: Use strategy pattern to draw a few colors

let brushRed = BrushRed()
let brushGreen = BrushGreen()
let canvas = Canvas()

canvas.set(brush: brushRed)
canvas.draw()

canvas.set(brush: brushGreen)
canvas.draw()
