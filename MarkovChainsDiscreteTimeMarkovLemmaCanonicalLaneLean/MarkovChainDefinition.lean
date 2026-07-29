import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean

structure MarkovChainPackage where
  stateSpace : Type u
  transitionMatrix : stateSpace → stateSpace → ℝ
  probability : ∀ s, ∀ t, transitionMatrix s t ≥ 0
  rowSumOne : ∀ s, ∑' t, transitionMatrix s t = 1
  initialState : stateSpace → ℝ
  initialSum : ∑' s, initialState s = 1
  initialNonneg : ∀ s, initialState s ≥ 0

structure MarkovChainEvidence (M : MarkovChainPackage) where
  probabilityClosed : ∀ s t, M.transitionMatrix s t ≥ 0 := by
    intro s t; exact M.probability s t
  rowSumOneClosed : ∀ s, ∑' t, M.transitionMatrix s t = 1 := by
    intro s; exact M.rowSumOne s
  initialSumClosed : ∑' s, M.initialState s = 1 := M.initialSum
  initialNonnegClosed : ∀ s, M.initialState s ≥ 0 := M.initialNonneg

def MarkovChainClosed (M : MarkovChainPackage) : Prop :=
  (∀ s t, M.transitionMatrix s t ≥ 0) ∧ (∀ s, ∑' t, M.transitionMatrix s t = 1) ∧
  (∑' s, M.initialState s = 1) ∧ (∀ s, M.initialState s ≥ 0)

theorem markov_chain_closed_from_evidence (M : MarkovChainPackage)
    (E : MarkovChainEvidence M) : MarkovChainClosed M := by
  exact And.intro E.probabilityClosed (And.intro E.rowSumOneClosed (And.intro E.initialSumClosed E.initialNonnegClosed))

end MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean
end HautevilleHouse