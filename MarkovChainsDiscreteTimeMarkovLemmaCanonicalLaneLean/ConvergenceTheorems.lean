import canonicalLaneMathlib.AdmissibleClass
import MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean.StationaryDistribution

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean

structure ConvergenceTheoremsPackage (S : StateSpace) (M : MarkovChainPackage S) (P : StationaryDistributionPackage S M) where
  totalVariationNormConvergence : Prop
  ergodicTheorem : Prop
  totalVariationNormConvergenceClosed : totalVariationNormConvergence
  ergodicTheoremClosed : ergodicTheorem

structure ConvergenceTheoremsEvidence (S : StateSpace) (M : MarkovChainPackage S) (P : StationaryDistributionPackage S M) (C : ConvergenceTheoremsPackage S M P) where
  totalVariationNormConvergenceClosed : C.totalVariationNormConvergence
  ergodicTheoremClosed : C.ergodicTheorem

def ConvergenceTheoremsClosed (S : StateSpace) (M : MarkovChainPackage S) (P : StationaryDistributionPackage S M) (C : ConvergenceTheoremsPackage S M P) : Prop :=
  C.totalVariationNormConvergence ∧ C.ergodicTheorem

theorem convergence_theorems_closed_from_evidence (S : StateSpace) (M : MarkovChainPackage S) (P : StationaryDistributionPackage S M) (C : ConvergenceTheoremsPackage S M P) (E : ConvergenceTheoremsEvidence S M P C) :
  ConvergenceTheoremsClosed S M P C := by
  exact And.intro E.totalVariationNormConvergenceClosed E.ergodicTheoremClosed

end MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean
end HautevilleHouse