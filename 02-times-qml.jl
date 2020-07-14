include("times.jl")

using QML

submit(result) = (resultstring[] = result)
@qmlfunction submit

load("times.qml",
  problem=JuliaPropertyMap(
    "prompt" => prompt,
    "resultstring" => resultstring,
    "statusstring" => statusstring,
  )
)

exec()