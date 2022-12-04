#=
        SYNTACTIC S̶U̶G̶A̶R̶ SAUCE
        =====================
        more than just sweet
=#


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  INFIX OPERATORS
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#=
    the following unicode symbolsꜝ have the special property in julia of being
    interpretable as infix operators, like multiplication or addition, etc.:
        * / ÷ % & ⋅ ∘ × \ ∩ ∧ ⊗ ⊘ ⊙ ⊚ ⊛ ⊠ ⊡ ⊓ ∗ ∙ ∤ ⅋ ≀ ⊼ ⋄ ⋆ ⋇ ⋉ ⋊ ⋋ ⋌ ⋏ ⋒ ⟑
        ⦸ ⦼ ⦾ ⦿ ⧶ ⧷ ⨇ ⨰ ⨱ ⨲ ⨳ ⨴ ⨵ ⨶ ⨷ ⨸ ⨻ ⨼ ⨽ ⩀ ⩃ ⩄ ⩋ ⩍ ⩎ ⩑ ⩓ ⩕ ⩘ ⩚ ⩜ ⩞ ⩟ ⩠
        ⫛ ⊍ ▷ ⨝ ⟕ ⟖ ⟗
    (ꜝc.f. https://discourse.julialang.org/t/is-not-an-operator/20221/2; there
     are also a few other overloadable infix operators, such as:
        – logical operrators, e.g., && and ||
        – the >> and << operators, which are probably bit-shifts (?REPL bug)
        – the pipe operators |> and <| extended below
     the extensibility of <| despite any default definition suggests that there
     may be other special symbols/combos thereof with this property as well...)
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
#   returns `3` analogously to the above example (note the extra parentheses on
#   the left, which are only necessary when left-piping anonymous functions)
<|( F, X ) = |>(X, F)

# STRING-ASSIGNMENT INFIX OPERATOR
#   metaprogramming shortcut, can be input using `\Colon<Tab>`; for example:
#       "RNG" ∷ rand()
#   places the variable `RNG` in global scope with value corresponding to the
#   associated `rand()` call———useful for automatically generating names
∷( handle::String, value ) = :( $(Symbol(handle)) = $value ) |> eval
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
