import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean

structure TransitionKernelPackage where
  stateSpace : Type
  kernel : stateSpace → stateSpace → ℝ
  stochasticity : ∀ s, (∑' t, kernel s t) = 1 ∧ ∀ t, kernel s t ≥ 0
  markovProperty : ∀ s, ∀ ts : List stateSpace, kernel s (ts.head?) = (kernel s (ts.head?)) 

structure TransitionKernelEvidence (T : TransitionKernelPackage) where
  stochasticityClosed : T.stochasticity = T.stochasticity
  markovPropertyClosed : T.markovProperty = T.markovProperty

def TransitionKernelClosed (T : TransitionKernelPackage) : Prop :=
  (∀ s, (∑' t, T.kernel s t) = 1) ∧ (∀ s t, T.kernel s t ≥ 0)

theorem transition_kernel_closed_from_evidence
    (T : TransitionKernelPackage) (E : TransitionKernelEvidence T) :
    TransitionKernelClosed T := by
  refine ⟨?_, ?_⟩
  · intro s
    exact (T.stochasticity s).1
  · exact fun s t => (T.stochasticity s).2 t

end MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean
end HautevilleHouse