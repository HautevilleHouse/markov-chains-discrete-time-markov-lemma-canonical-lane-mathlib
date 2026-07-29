import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def bridgeClosed (A : AdmissibleClass) : Prop :=
  MarkovWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end MarkovChainsDiscreteTimeMarkovLemmaCanonicalLaneLean
end HautevilleHouse