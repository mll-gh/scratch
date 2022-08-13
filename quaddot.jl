#=

        METAPROGRAMMING INFIX ASSIGNMENT OPERATOR
        =========================================
        creates an object in global scope from a string-valued left-hand-side:
        the line
            ` "handle" ∷ object `
        is equivalent to
            ` handle = object `,
        which allows variable names to be scripted

=#


∷(handle::String, value::Any) = :( $(Symbol(handle)) = $value ) |> eval
