import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean

structure DiscreteTimeMarkovChain (S : StateSpacePackage) (T : TransitionKernelPackage S) where
  initialDistribution : S.stateType → ℝ
  nonnegativeInit : ∀ i, initialDistribution i ≥ 0
  sumInit : ∑' i, initialDistribution i = 1
  markovProperty : Prop
  markovPropertyTerm : markovProperty

structure DiscreteTimeMarkovLemma {S : StateSpacePackage} {T : TransitionKernelPackage S} 
    (M : DiscreteTimeMarkovChain S T) where
  nStepTransition : ℕ → S.stateType → S.stateType → ℝ
  chapmanKolmogorov : ∀ (m n : ℕ) (i j : S.stateType),
    nStepTransition (m + n) i j = ∑' k, nStepTransition m i k * nStepTransition n k j
  chapmanKolmogorovTerm : ∀ (m n : ℕ) (i j : S.stateType),
    nStepTransition (m + n) i j = ∑' k, nStepTransition m i k * nStepTransition n k j

def DiscreteTimeMarkovLemmaClosed {S : StateSpacePackage} {T : TransitionKernelPackage S}
    {M : DiscreteTimeMarkovChain S T} (L : DiscreteTimeMarkovLemma M) : Prop :=
  ∀ (m n : ℕ) (i j : S.stateType),
    L.nStepTransition (m + n) i j = ∑' k, L.nStepTransition m i k * L.nStepTransition n k j

theorem discrete_time_markov_lemma_closed_from_evidence
    {S : StateSpacePackage} {T : TransitionKernelPackage S}
    {M : DiscreteTimeMarkovChain S T} (L : DiscreteTimeMarkovLemma M) :
    DiscreteTimeMarkovLemmaClosed L :=
  L.chapmanKolmogorovTerm

end MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean
end HautevilleHouse