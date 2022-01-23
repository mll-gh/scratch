#=
    METAPROGRAMMING INFIX ASSIGNMENT OPERATOR
    -----------------------------------------
    streamlines the creation of objects via string-valued left-hand-sides:
    the line
        "handle" ∷ object
    is equivalent to
        handle = object
    without the quotes, and so object naming can be neatly scripted
=#


∷(handle::String, value::Any) = :( $(Symbol(handle)) = $value ) |> eval
