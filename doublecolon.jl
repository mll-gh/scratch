#=
    METAPROGRAMMING INFIX ASSIGNMENT OPERATOR
    -----------------------------------------
    streamlines the creation of objects via string-valued left-hand-sides:
    the line
        "string" ∷ object
    is equivalent to
        string = object
    without the quotes, and so object naming can be neatly scripted
=#


∷(handle, value) = :( $(Symbol(handle)) = $value ) |> eval
