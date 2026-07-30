import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ViscositySolutionsHamiltonJacobiEquationsCanonicalLaneLean

def ConstrainedViscosityClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_viscosity_endgame (A : AdmissibleClass) :
    ConstrainedViscosityClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end HautevilleHouse
end ViscositySolutionsHamiltonJacobiEquationsCanonicalLaneLean
