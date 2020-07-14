ENV["QSG_RENDER_LOOP"] = "basic"

using QML
using Observables
using ColorTypes
import CxxWrap # for safe_cfunction
using Images # for display

const qmlfile = "circle.qml"

const diameter = Observable(-1.0)

# callback to paint circle
function paintcircle(width, height, d)
  width, height = Int.((height, width)) # Height and width are swapped with respect to QML
  buffer = Array{ARGB32,2}(undef, width, height)

  center_x = width/2
  center_y = height/2
  rad2 = (diameter[]/2)^2
  for x in 1:width
      for y in 1:height
          if (x-center_x)^2 + (y-center_y)^2 < rad2
              buffer[x,y] = ARGB32(1, 0, 0, 1) #red
          else
              buffer[x,y] = ARGB32(0, 0, 0, 1) #black
          end
      end
  end
  display(d, buffer)
  return
end
@qmlfunction paintcircle

load(qmlfile,
  parameters=JuliaPropertyMap("diameter" => diameter)
)
exec()
