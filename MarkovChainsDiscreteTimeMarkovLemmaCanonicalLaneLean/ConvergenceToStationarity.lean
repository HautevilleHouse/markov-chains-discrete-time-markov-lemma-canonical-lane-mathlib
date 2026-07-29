import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean

structure ConvergenceToStationarityPackage (M : MarkovChainPackage)
    (L : DiscreteTimeMarkovLemmaPackage M) where
  totalVariationDistance : ℕ → ℝ
  limitZero : Filter.Tendsto (λ n : ℕ => totalVariationDistance n) Filter.atTop (nhds 0)
  rateOfConvergence : ℕ → ℝ
  rateDominates : ∃ C : ℝ, ∀ n : ℕ, totalVariationDistance n ≤ C * rateOfConvergence n
  mixingTime : ℕ
  mixingBound : ∀ n ≥ mixingTime, totalVariationDistance n ≤ 1 / 2

structure ConvergenceToStationarityEvidence {M : MarkovChainPackage}
    {L : DiscreteTimeMarkovLemmaPackage M}
    (C : ConvergenceToStationarityPackage M L) where
  limitZeroClosed : Filter.Tendsto (λ n : ℕ => C.totalVariationDistance n) Filter.atTop (nhds 0) := C.limitZero
  rateDominatesClosed : ∃ C' : ℝ, ∀ n : ℕ, C.totalVariationDistance n ≤ C' * C.rateOfConvergence n := by
    rcases C.rateDominates with ⟨C', h⟩; exact ⟨C', h⟩
  mixingBoundClosed : ∀ n ≥ C.mixingTime, C.totalVariationDistance n ≤ 1 / 2 := C.mixingBound

def ConvergenceToStationarityClosed {M : MarkovChainPackage}
    {L : DiscreteTimeMarkovLemmaPackage M}
    (C : ConvergenceToStationarityPackage M L) : Prop :=
  Filter.Tendsto (λ n : ℕ => C.totalVariationDistance n) Filter.atTop (nhds 0) ∧
  (∃ C' : ℝ, ∀ n : ℕ, C.totalVariationDistance n ≤ C' * C.rateOfConvergence n) ∧
  (∀ n ≥ C.mixingTime, C.totalVariationDistance n ≤ 1 / 2)

theorem convergence_to_stationarity_closed_from_evidence {M : MarkovChainPackage}
    {L : DiscreteTimeMarkovLemmaPackage M} (C : ConvergenceToStationarityPackage M L)
    (E : ConvergenceToStationarityEvidence C) : ConvergenceToStationarityClosed C := by
  exact And.intro E.limitZeroClosed (And.intro E.rateDominatesClosed E.mixingBoundClosed)

end MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean
end HautevilleHouse