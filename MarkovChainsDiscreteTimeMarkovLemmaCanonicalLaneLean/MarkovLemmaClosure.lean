import canonicalLaneMathlib.AdmissibleClass
import MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean.ConvergenceTheorems

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean

def ConstrainedMarkovClosure (S : StateSpace) (M : MarkovChainPackage S) (P : StationaryDistributionPackage S M) (C : ConvergenceTheoremsPackage S M P) : Prop :=
  bridgeClosed (AdmittedObject.mk ...) ∧ gateClosed (AdmittedObject.mk ...)

theorem constrained_markov_endgame (S : StateSpace) (M : MarkovChainPackage S) (P : StationaryDistributionPackage S M) (C : ConvergenceTheoremsPackage S M P) :
  ConstrainedMarkovClosure S M P C := by
  exact And.intro (by
    -- bridge construction from convergence evidence
    exact bridge_from_admissible_class (AdmittedObject.mk ...))
    (by
    -- gate construction from stationary distribution evidence
    exact gate_from_admissible_class (AdmittedObject.mk ...))

end MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean
end HautevilleHouse