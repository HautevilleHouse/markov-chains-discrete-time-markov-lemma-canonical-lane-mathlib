import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean

structure MarkovAdmittedObject where
  markovChain : MarkovChainPackage
  markovChainClosed : MarkovChainClosed markovChain
  lemmaPackage : DiscreteTimeMarkovLemmaPackage markovChain
  lemmaClosed : DiscreteTimeMarkovLemmaClosed lemmaPackage
  convergencePackage : ConvergenceToStationarityPackage markovChain lemmaPackage
  convergenceClosed : ConvergenceToStationarityClosed convergencePackage
  conclusion : lemmaClosed ∧ convergenceClosed

structure MarkovAdmissibleClass where
  object : MarkovAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def bridgeClosed (A : MarkovAdmissibleClass) : Prop :=
  MarkovChainClosed A.object.markovChain ∧ DiscreteTimeMarkovLemmaClosed A.object.lemmaPackage

theorem bridge_from_admissible_class (A : MarkovAdmissibleClass) : bridgeClosed A := by
  exact And.intro A.object.markovChainClosed A.object.lemmaClosed

def gateClosed (A : MarkovAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : MarkovAdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedMarkovClosure (A : MarkovAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_markov_endgame (A : MarkovAdmissibleClass) : ConstrainedMarkovClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean
end HautevilleHouse