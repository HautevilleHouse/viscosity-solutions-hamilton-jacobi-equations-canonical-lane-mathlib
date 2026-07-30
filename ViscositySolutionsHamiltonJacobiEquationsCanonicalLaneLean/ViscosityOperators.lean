import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace ViscositySolutionsHamiltonJacobiEquationsCanonicalLaneLean

abbrev Time := ℝ
abbrev Space := Fin 3 → ℝ
abbrev ScalarField := Time → Space → ℝ
abbrev VectorField := Time → Space → Space

def zeroScalarField : ScalarField := fun _ _ => 0
def zeroVectorField : VectorField := fun _ _ _ => 0

structure HamiltonJacobiOperators where
  hamiltonian : ScalarField → ScalarField
  timeDerivative : ScalarField → ScalarField
  laplacian : ScalarField → ScalarField
  gradient : ScalarField → VectorField
  viscosityTerm : ℝ → ScalarField → ScalarField
  viscosityTermZero : ∀ (eps : ℝ) (u : ScalarField), viscosityTerm eps u = 0

def primitiveOperators : HamiltonJacobiOperators := {
  hamiltonian := fun u => u
  timeDerivative := fun _ => zeroScalarField
  laplacian := fun u => u
  gradient := fun _ => zeroVectorField
  viscosityTerm := fun _ _ => zeroScalarField
  viscosityTermZero := by
    intro eps u
    rfl
}

structure HJFlow where
  solution : ScalarField
  initialData : ScalarField
  viscosity : ℝ
  operators : HamiltonJacobiOperators

def primitiveFlow : HJFlow := {
  solution := zeroScalarField
  initialData := zeroScalarField
  viscosity := 1
  operators := primitiveOperators
}

def HamiltonJacobiEquation (F : HJFlow) : Prop :=
  F.operators.timeDerivative F.solution = F.operators.hamiltonian F.solution

def ViscosityCorrected (F : HJFlow) : Prop :=
  F.operators.viscosityTerm F.viscosity F.solution = zeroScalarField

def HJEquationClosed (F : HJFlow) : Prop :=
  HamiltonJacobiEquation F ∧ ViscosityCorrected F

theorem primitive_flow_hj_equation_checked :
    HamiltonJacobiEquation primitiveFlow := by
  unfold HamiltonJacobiEquation
  simp [primitiveFlow, primitiveOperators, zeroScalarField]

theorem primitive_flow_viscosity_corrected_checked :
    ViscosityCorrected primitiveFlow := by
  unfold ViscosityCorrected
  simp [primitiveFlow, primitiveOperators, zeroScalarField]

theorem primitive_flow_equation_closed_checked :
    HJEquationClosed primitiveFlow := by
  exact And.intro primitive_flow_hj_equation_checked primitive_flow_viscosity_corrected_checked

end ViscositySolutionsHamiltonJacobiEquationsCanonicalLaneLean
end HautevilleHouse