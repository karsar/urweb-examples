(* this comes with minor modification from Gabriel Riba *)
con svg = [Svg]
con xsvg = xml svg [] []
con svgTagAttrs = [X = string, Y = string, Width = string, Height = string,
                        ViewBox = string, PreserveAspectRatio = string,
                        ZoomAndPan = string] ++ boxAttrs

val svg : unit -> tag svgTagAttrs body svg [] []

con svgTag = fn (attrs :: {Type}) =>
        ctx ::: {Unit} ->
        [[Svg] ~ ctx] =>
        unit -> tag attrs ([Svg] ++ ctx) ([Svg] ++ ctx) [] []

(* * Events *)

con graphicsElementsEvents = focusEvents ++ mouseEvents
con docEvents = resizeEvents ++ scrollEvents

(* * Attrs *)

con commonAttrs = [Id = id, Base = string]
con langSpaceAttrs = [Lang = string, Space= string]
con transformAttrs = [Transform = string]
con testAttrs = [RequiredFeatures = string, RequiredExtensions = string, SystemLanguage = string]

con typicalAttrs = commonAttrs ++ langSpaceAttrs ++ transformAttrs ++ testAttrs ++ graphicsElementsEvents

(*** tags *)

val path : svgTag ([D = string, PathLength = string] ++ typicalAttrs)
val text : svgTag ([X = string, Y = string, Dx = string, Dy = string,
                    Rotate = string, TextLength = string, LengthAdjust = string] ++ typicalAttrs)
(* my addition *)
val circle: svgTag([Cx = string, Cy = string, R = string, Stroke = string, Fill = string] ++ typicalAttrs)
val line : svgTag ([X1 = string, Y1 = string, X2 = string, Y2 = string, Stroke = string] ++ typicalAttrs)
