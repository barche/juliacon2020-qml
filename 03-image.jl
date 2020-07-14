using Test
using QML
using Images
using TestImages

function showimage(d::JuliaDisplay)
  ima = testimage("mandrill")
  @show typeof(ima)
  display(d, ima)
end
@qmlfunction showimage

load("image.qml")

# Run the application
exec()
