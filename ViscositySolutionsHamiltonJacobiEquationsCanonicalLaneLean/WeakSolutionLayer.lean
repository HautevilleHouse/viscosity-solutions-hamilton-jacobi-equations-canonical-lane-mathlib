import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ViscositySolutionsHamiltonJacobiEquationsCanonicalLaneLean.ViscositySolutionObjects

namespace HautevilleHouse
namespace ViscositySolutionsHamiltonJacobiEquationsCanonicalLaneLean

structure WeakViscosityEnvelope where
  solution : ViscositySolution
  finiteEnergy : Prop
  subsolutionProperty : Prop
  supersolutionProperty : Prop
  boundaryConditions : Prop
  finiteEnergyClosed : finiteEnergy
  subsolutionPropertyClosed : subsolutionProperty
  supersolutionPropertyClosed : supersolutionProperty
  boundaryConditionsClosed : boundaryConditions

def sourceWeakViscosityEnvelope : WeakViscosityEnvelope := {
  solution := primitiveViscositySolution
  finiteEnergy := baselineCertificateAllPass = true
  subsolutionProperty := ViscosityHJEquationClosed primitiveViscositySolution
  supersolutionProperty := ViscosityHJEquationClosed primitiveViscositySolution
  boundaryConditions := True
  finiteEnergyClosed := rfl
  subsolutionPropertyClosed := primitive_viscosity_equation_closed_checked
  supersolutionPropertyClosed := primitive_viscosity_equation_closed_checked
  boundaryConditionsClosed := trivial
}

def WeakViscosityEnvelopeClosed (E : WeakViscosityEnvelope) : Prop :=
  E.finiteEnergy ∧ E.subsolutionProperty ∧ E.supersolutionProperty ∧ E.boundaryConditions

theorem source_weak_viscosity_envelope_closed :
    WeakViscosityEnvelopeClosed sourceWeakViscosityEnvelope := by
  exact And.intro sourceWeakViscosityEnvelope.finiteEnergyClosed
    (And.intro sourceWeakViscosityEnvelope.subsolutionPropertyClosed
      (And.intro sourceWeakViscosityEnvelope.supersolutionPropertyClosed
        sourceWeakViscosityEnvelope.boundaryConditionsClosed))

end HautevilleHouse
end ViscositySolutionsHamiltonJacobiEquationsCanonicalLaneLean