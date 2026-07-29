import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean

structure ConvergenceRatePackage (P : TransitionMatrixPackage)
    (S : StationaryDistributionPackage P) (M : MarkovLemmaPackage P S) where
  spectralGap : ℝ
  totalVariationDecay : Prop
  exponentialConvergence : Prop
  spectralGapPositive : spectralGap > 0
  totalVariationDecayTerm : totalVariationDecay
  exponentialConvergenceTerm : exponentialConvergence

structure ConvergenceRateEvidence (P : TransitionMatrixPackage)
    (S : StationaryDistributionPackage P) (M : MarkovLemmaPackage P S)
    (C : ConvergenceRatePackage P S M) where
  spectralGapPositiveClosed : C.spectralGapPositive
  totalVariationDecayClosed : C.totalVariationDecay
  exponentialConvergenceClosed : C.exponentialConvergence

def ConvergenceRateClosed (P : TransitionMatrixPackage)
    (S : StationaryDistributionPackage P) (M : MarkovLemmaPackage P S)
    (C : ConvergenceRatePackage P S M) : Prop :=
  C.spectralGapPositive ∧ C.totalVariationDecay ∧ C.exponentialConvergence

theorem convergence_rate_closed_from_evidence (P : TransitionMatrixPackage)
    (S : StationaryDistributionPackage P) (M : MarkovLemmaPackage P S)
    (C : ConvergenceRatePackage P S M) (E : ConvergenceRateEvidence P S M C) :
    ConvergenceRateClosed P S M C := by
  exact And.intro E.spectralGapPositiveClosed (And.intro E.totalVariationDecayClosed E.exponentialConvergenceClosed)

end MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean
end HautevilleHouse