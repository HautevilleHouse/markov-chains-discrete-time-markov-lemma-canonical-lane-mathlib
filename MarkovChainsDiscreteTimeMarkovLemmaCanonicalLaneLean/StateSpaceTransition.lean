import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean

structure StateSpacePackage where
  stateType : Type u
  sigmaAlgebra : Set (Set stateType)
  countable : Prop
  countableTerm : countable

structure TransitionKernelPackage (S : StateSpacePackage) where
  transitionMatrix : S.stateType -> S.stateType -> ℝ
  nonnegative : ∀ i j, transitionMatrix i j ≥ 0
  rowSumOne : ∀ i, ∑' j, transitionMatrix i j = 1
  nonnegativeTerm : ∀ i j, transitionMatrix i j ≥ 0
  rowSumOneTerm : ∀ i, ∑' j, transitionMatrix i j = 1

def TransitionKernelClosed {S : StateSpacePackage} (T : TransitionKernelPackage S) : Prop :=
  (∀ i j, T.transitionMatrix i j ≥ 0) ∧ (∀ i, ∑' j, T.transitionMatrix i j = 1)

theorem transition_kernel_closed_from_evidence
    {S : StateSpacePackage} (T : TransitionKernelPackage S) : 
    TransitionKernelClosed T :=
  And.intro T.nonnegativeTerm T.rowSumOneTerm

end MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean
end HautevilleHouse