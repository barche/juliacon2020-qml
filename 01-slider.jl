using QML
using Observables

slidervalue = Observable(0.0)

load(
  "slider.qml",
  variables = JuliaPropertyMap(
    "slidervalue" => slidervalue
  )
)

exec_async()
