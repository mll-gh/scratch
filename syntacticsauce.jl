#=
        SYNTACTIC S̶U̶G̶A̶R̶ SAUCE
        =====================
        more than just sweet
=#


# EXTENSION OF PIPE OPERATOR TO HIGHER-ARITY FUNCTIONS
import Base.|>
#   now the right-hand-side in piped expressions can have multiple arguments;
#   for example:
#       (1, 2) |> (a,b)-> a+b
#   returns `3` instead of an error———makes anonymous function calls much
#   prettier and more readable overall (shouldn't break default behavior)
|>( X, F ) = length(X) ∈ (f.nargs-1 for f in methods(F)) ? F(X...) : F(X)


# LEFT-PIPE OPERATOR———FOR AVOIDING EVEN MORE PARENTHESES
#   the above syntax can be extended further to support a mirrored version;
#   for example:
#       ((a,b)-> a+b) <| (1,2)
#   returns `3` analogously to the above example (note the extra parentheses
#   on the left, which are only necessary when left-piping anonymous functions)
<|( F, X ) = |>(X, F)


# STRING-ASSIGNMENT INFIX OPERATOR
#   metaprogramming shortcut, can be input using `\Colon<Tab>`; for example:
#       "RNG" ∷ rand()
#   places the variable `RNG` in global scope with value corresponding to
#   the associated `rand()` call———useful for automatically generating names
∷( handle::String, value ) = :( $(Symbol(handle)) = $value ) |> eval
