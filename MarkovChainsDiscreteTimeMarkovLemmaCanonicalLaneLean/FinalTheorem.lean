import canonicalLaneMathlib.AdmissibleClass
import MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean.StateSpaceTransition
import MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean.DiscreteTimeMarkovLemma
import MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean.StationaryDistribution

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean

def ConstrainedMarkovClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_markov_endgame (A : AdmissibleClass) :
    ConstrainedMarkovClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean
end HautevilleHouse